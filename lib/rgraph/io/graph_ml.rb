# frozen_string_literal: true

require "ffi"
require_relative "../bindings/c"

module RGraph
  #
  # Igraph IO
  #
  module IO
    #
    # GraphML
    #
    module GraphML
      #
      # Adds class methods.
      #
      def self.included(base)
        base.extend(GraphML::Read)
      end

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
          raise "Error: Openning a file with fopen failed."
        end

        Bindings.igraph_write_graph_graphml(self, file_pointer, prefixattr)
        Bindings::C.fclose(file_pointer)
      end

      #
      # Class methods
      #
      module Read
        #
        # Reads the graph from a GraphML file.
        #
        # @param [String] path
        #   Path to an input file.
        #
        # @param [Integer] instream
        #   A graphg index.
        #
        # @return [Graph]
        #   The graph instance.
        #
        def read(path, instream = 0)
          file_pointer = Bindings::C.fopen(path, "r")

          if file_pointer.null?
            raise "Error: Openning a file with fopen failed."
          end

          Graph.new do |graph|
            Bindings.igraph_read_graph_graphml(graph, file_pointer, instream)
            Bindings::C.fclose(file_pointer)
          end
        end
      end
    end
  end
end
