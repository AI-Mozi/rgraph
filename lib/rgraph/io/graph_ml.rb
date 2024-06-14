# frozen_string_literal: true

require "ffi"
require_relative "../bindings/c"

module RGraph
  module IO
    #
    # GraphML
    #
    module GraphML
      #
      # Writes the graph to a file in GraphML format.
      #
      # @param [String] path
      #   Path to an output file.
      #
      # @param [Boolean] prefixattr
      #   Indicates whether to put a prefix in front of the
      #   attribute names to ensure uniqueness.
      #
      def write(path, prefixattr: false)
        file_pointer = Bindings::C.fopen(path, "w")

        if file_pointer.null?
          raise "Error: Openning file with fopen failed."
        end

        Bindings.igraph_write_graph_graphml(self, file_pointer, prefixattr)
        Bindings::C.fclose(file_pointer)
      end
    end
  end
end
