# frozen_string_literal: true

require_relative "vector"

module RGraph
  #
  # Data structure for storing graphs.
  #
  class Graph < FFI::Struct
    attr_reader :pointer

    layout :n, :int,
           :directed, :bool,
           :from,     Vector,
           :to,       Vector,
           :oi,       Vector,
           :ii,       Vector,
           :os,       Vector,
           :is,       Vector,
           :attr,     :pointer

    def initialize
      @pointer = FFI::MemoryPointer.new(Graph)
      yield self if block_given?
    end
    private :initialize

    #
    # Creates an empty graph.
    #
    # @param [Integer] size
    #   Number of vertices in the graph.
    #
    # @param [Boolean] directed
    #   Indicates whether to create a directed graph.
    #
    # @return [Graph]
    #   The graph instance.
    #
    def self.empty(size, directed: false)
      new { |graph| Bindings.igraph_empty(graph, size, directed) }
    end

    #
    # Creates a full graph.
    #
    # @param [Integer] size
    #   Number of vertices in the graph.
    #
    # @param [Boolean] directed
    #   Indicates whether to create a directed graph.
    #
    # @param [Boolean] loops
    #   Indicates whether to include loops.
    #
    # @return [Graph]
    #   The graph instance.
    #
    def self.full(size, directed: false, loops: false)
      if size < 2
        raise(ArgumentError, "#{size.inspect} is an invalid number of vertices.")
      end

      new { |graph| Bindings.igraph_full(graph, size, directed, loops) }
    end

    #
    # Creates a ring graph.
    #
    # @param [Integer] size
    #   Number of vertices in the graph.
    #
    # @param [Boolean] directed
    #   Indicates whether to create a directed graph.
    #
    # @param [Boolean] mutual
    #   Indicates whether to create mutual edges in directed graph.
    #   Ignored for undirected graphs.
    #
    # @param [Boolean] circural
    #   Indicates whether to create a closed ring or an open path.
    #
    # @return [Graph]
    #   The graph instance.
    #
    def self.ring(size, directed: false, mutual: false, circular: false)
      if size < 0
        raise(ArgumentError, "#{size.inspect} is an invalid number of vertices. Can't be negative.")
      end

      new { |graph| Bindings.igraph_ring(graph, size, directed, mutual, circular) }
    end

    #
    # Creates a k-ary tree in wchich almost all
    # vertices have k children.
    #
    # @param [Integer] size
    #   Number of vertices in the graph.
    #
    # @param [Ingere] children
    #   The number of vertices in the graph
    #
    # @param [Constants::TreeMode] type
    #   The tree orientation type.
    #
    # @return [Graph]
    #   The graph instance.
    #
    def self.kary_tree(size, children, type)
      if size < 0
        raise(ArgumentError, "#{size.inspect} is an invalid number of vertices. Can't be negative.")
      end

      if children <= 0
        raise(ArgumentError, "#{children} is an invalid number of children. Must be positive.")
      end

      unless [Constants::TreeMode::OUT, Constants::TreeMode::IN, Constants::TreeMode::UNDIRECTED].include?(type)
        raise(ArgumentError, "#{type.inspect} is an invalid tree orientation type.")
      end

      new { |graph| Bindings.igraph_kary_tree(graph, size, children, type) }
    end

    #
    # Creates a star graph.
    #
    # @param [Integer] size
    #   Number of vertices in the graph.
    #
    # @param [Constants::StarMode] mode
    #   The type of the star graph to create.
    #
    # @param [Integer] center
    #   The id of the center vertex.
    #
    # @return [Graph]
    #   The graph instance.
    #
    def self.star(size, mode, center)
      if size < 0
        raise(ArgumentError, "#{size.inspect} is an invalid number of vertices. Can't be negative.")
      end

      if center < 0 || center > size - 1
        raise(ArgumentError, "#{center.inspect} is an invalid center vertex.")
      end

      unless [Constants::StarMode::IN,
              Constants::StarMode::OUT,
              Constants::StarMode::MUTUAL,
              Constants::StarMode::UNDIRECTED].include?(mode)
        raise(ArgumentError, "#{mode.inspect} is an invalid star mode.")
      end

      new { |graph| Bindings.igraph_star(graph, size, mode, center) }
    end

    #
    # Creates a wheel graph.
    #
    # @param [Integer] size
    #   Number of vertices in the graph.
    #
    # @param [Constants::StarMode] mode
    #   Type of the star graph.
    #
    # @param [Integer] center
    #   The id of the center vertex.
    #
    # @raturn [Graph]
    #   The graph instance.
    #
    def self.wheel(size, mode, center)
      new { |graph| Bindings.igraph_wheel(graph, size, mode, center) }
    end

    def self.destroy(graph)
      Bindings.igraph_destroy(graph)
    end

    def add_edge(from, to)
      Bindings.igraph_add_edge(self, from, to)
    end

    def edges_count
      Bindings.igraph_ecount(self)
    end

    def directed?
      Bindings.igraph_is_directed(self)
    end
  end
end
