# frozen_string_literal: true

module Codegen
  IGRAPH_C_CORE_SOURCE_FOLDER = File.join(Dir.home, "dev", "igraph", "igraph")
  SOURCE_FOLER = File.expand_path("..", __dir__)

  module Enums
    IGNORED_ENUMS = [
      "igraph_cached_property_t",
      "igraph_lapack_dsyev_which_t",
    ]
    ENUM_NAME_REMAPPING = {
      "Adjacency" => "AdjacencyMode",
      "AttributeElemtype" => "AttributeElementType",
      "BlissSh" => "BLISSSplittingHeuristics",
      "ColoringGreedy" => "GreedyColoringHeuristics",
      "Degseq" => "DegreeSequenceMode",
      "EdgeorderType" => "EdgeOrder",
      "EitType" => "EdgeIteratorType",
      "ErdosRenyi" => "ErdosRenyiType",
      "ErrorType" => "ErrorCode",
      "EsType" => "EdgeSequenceType",
      "FasAlgorithm" => "FeedbackArcSetAlgorithm",
      "FileformatType" => "FileFormat",
      "LayoutDrlDefault" => "DRLLayoutPreset",
      "LazyAdlistSimplify" => "LazyAdjacencyListSimplify",
      "Loops": nil,
      "Neimode" => "NeighborMode",
      "Optimal" => "Optimality",
      "PagerankAlgo" => "PagerankAlgorithm",
      "RandomTree" => "RandomTreeMethod",
      "SparsematType" => "SparseMatrixType",
      "SparsematSolve" => "SparseMatrixSolver",
      "SpincommUpdate" => "SpinglassUpdateMode",
      "VitType" => "VertexIteratorType",
      "VsType" => "VertexSequenceType",
    }
    EXTRA_ENUM_MEMBERS = {
        "GreedyColoringHeuristics": [["NEIGHBORS", "COLORED_NEIGHBORS"]],
        "LayoutGrid": [["NO_GRID", "NOGRID"], ["AUTO_GRID", "AUTOGRID"]],
        "Loops": [["IGNORE", 0]],
    }

    # Generates the contents of `enums.rb` in the source tree by parsing
    # the given include files from igraph's source tree.
    # Parsing is done with crude string operations and not with a real C parser
    # so the formatting of the input file matters.
    def self.generate(template, output, headers)
      File.open(output, "w") do |output_file|
        output_file.write(File.read(template))
        
        headers.each do |header_path|
          File.open(header_path, "r") do |header_file|
            process_file(output_file, header_file)
          end
        end
      end
    end

    def self.process_enum(output_file, spec)
      spec = spec.gsub(/\s*\/\*[^\/]*\*\/\s*/, " ")
      spec = spec.gsub("IGRAPH_DEPRECATED_ENUMVAL", "")
      spec = spec.gsub(/\s+/, " ")

      sep = spec.rindex("}")
      unless sep
        raise StandardError("invalid enum, need braces") # TODO: CHANGE ERROR
      end
      name = spec[(sep + 2)..]
      unless name
        return nil
      end
      spec = spec[...sep]

      sep = spec.index("{")
      unless sep
        raise StandardError("invalid enum, need braces") # TODO: CHANGE ERROR
      end
      spec = spec[(sep + 2)..].strip

      name = name&.sub(";", "").strip.downcase
      orig_name = name
      if IGNORED_ENUMS.include?(orig_name)
        return nil
      end

      if !name.start_with?("igraph_") || name.start_with?("igraph_i_")
        return nil
      end

      name = name[7..]
      if name.end_with?("_t")
        name = name[..-2]
      end
      name = name.split("_").map(&:capitalize).join
      
      entries = spec.split(",").map(&:strip)
      plen = longest_common_prefix_length(entries)
      entries.map! { |entry| entry[plen..] }

      remapped_name = ENUM_NAME_REMAPPING[name]
      unless remapped_name
        return name
      else
        name = remapped_name
      end
      
      output_file.write("# Ruby counterpart of an `#{orig_name}` enum.\n")
      output_file.write("class #{name}\n")

      last_value = -1
      all_members = {}
      all_values = {}

      # p [name, entries]
      entries.each do |entry|
        entry = entry.gsub(" ", "")
        sep = entry.index("=")
        key, value = entry.split("=")

        if sep
          key = entry[...sep]
          value = entry[(sep + 1)..]

          begin
            value_int = Integer(value)
          rescue
            next
          end
        else
          key = entry
          value_int = last_value + 1
        end

        begin
          key = Integer(key)
        rescue
        else
          if key == 1
            key = "ONE"
          else
            raise StandardError, "enum key is not a valid Ruby identifier: #{key}"
          end
        end

        output_file.write("  #{key} = #{value_int}\n")
        all_members[key.downcase] = key
        all_values[key.downcase] = value_int
        last_value = value_int
      end

      output_file.write("\n  SYMBOL_MAP = {\n")
      all_members.keys.each do |key|
        output_file.write("    #{key}: #{all_members[key]},\n")
      end
      output_file.write("  }\n")

      output_file.write("end")
      output_file.write("\n")
    end

    def self.process_file(output_file, input_file)
      all_names = []

      current_enum, in_enum = [], false
      input_file.each_line do |line|
        line = line.strip

        if line.start_with?("typedef enum")
          current_enum = [line]
          in_enum = !line.include?("}")
        elsif in_enum
          current_enum << line
          in_enum = !line.include?("}")
        end

        if !current_enum.empty? && !in_enum
          name = process_enum(output_file, current_enum.join(" "))
          all_names << name if name
          current_enum = []
        end
      end

      return all_names
    end

    # Finds the length of the longest common prefix of the given list of
    # strings.
    def self.longest_common_prefix_length(items)
      return 0 if items.empty?

      best = 0
      min_length = items.min.size
      1.upto(min_length) do |i|
        prefixes = items.map { |item| item[...i] }
        if prefixes.uniq.size > 1
          break
        end

        if prefixes[0][-1] != "_"
          next
        end

        best = i
      end

      best
    end
  end

  #
  # Executes the code generation steps that are needed to make the source
  # code of the Ruby extension complete.
  #
  def self.run
    common_args = [
      "stimulus",
      "-f",
      File.join(IGRAPH_C_CORE_SOURCE_FOLDER, "interfaces", "functions.yaml"),
      "-t",
      File.join(IGRAPH_C_CORE_SOURCE_FOLDER, "interfaces", "types.yaml"),
      "-f",
      File.join(SOURCE_FOLER, "codegen", "functions.yaml"),
      "-t",
      File.join(SOURCE_FOLER, "codegen", "types.yaml")
    ]

    args = [
      *common_args + [
        "-l",
        "ruby:ffi",
        "-i",
        File.join(SOURCE_FOLER, "codegen", "internal_lib.rb.in"),
        "-o",
        File.join(SOURCE_FOLER, "rgraph", "_internal", "lib.rb")
      ]
    ]

    system(*args)

    args = [
      *common_args + [
        "-l",
        "ruby:ruby",
        "-i",
        File.join(SOURCE_FOLER, "codegen", "internal_functions.rb.in"),
        "-o",
        File.join(SOURCE_FOLER, "rgraph", "_internal", "functions.rb")
      ]
    ]

    system(*args)

    Enums.generate(
      File.join(SOURCE_FOLER, "codegen", "internal_enums.rb.in"),
      File.join(SOURCE_FOLER, "rgraph", "_internal", "enums.rb"),
      Dir.glob(File.join(IGRAPH_C_CORE_SOURCE_FOLDER, "include", "*.h"))
    )
  end
end

Codegen.run
