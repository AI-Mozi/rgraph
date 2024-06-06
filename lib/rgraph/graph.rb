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

    #
    # Generates a random (Erdős-Rényi) graph.
    #
    # @param [Constants::ErdosRenyi] type
    #   Type of the Erdős-Rényi graph.
    #
    # @param [Integer] size
    #   Number of vertices in the graph.
    #
    # @param [Integer] p_or_m
    #   This is the p parameter for
    #   G(n,p) graphs and the m parameter for G(n,m) graphs.
    #
    # @param [Boolean] directed
    #   Indicates whether to create a directed graph.
    #
    # @param [Boolean] loops
    #   Indicates whether to create loops.
    #
    # @return [Graph]
    #   The graph instance.
    #
    def self.erdos_renyi_game(type, size, p_or_m, directed: false, loops: false)
      unless [Constants::ErdosRenyi::GNP, Constants::ErdosRenyi::GNM].include?(type)
        raise(ArgumentError, "#{type.inspect} is an invalid Erdos Renyi type.")
      end

      new { |graph| Bindings.igraph_erdos_renyi_game(graph, type, size, p_or_m, directed, loops) }
    end

    #
    # Generates Watts-Strogatz small-world model.
    #
    # @param [Integer] dim
    #   The dimension of the lattice.
    #
    # @param [Integer] size
    #   The size of the lattice along each dimension.
    #
    # @param [Integer] nei
    #   The size of the neighborhood for each vertex.
    #
    # @param [Float] prob
    #   The rewriting probability.
    #
    # @param [Boolean] loops
    #   Indicates whether to create loops.
    #
    # @param [Boolean] multiple
    #   Indicates whether to allow multiple edges.
    #
    # @return [Graph]
    #   The graph instace.
    #
    def self.watts_strogatz_game(dim, size, nei, prob, loops: false, multiple: false)
      if dim < 1
        raise(ArgumentError, "#{dim.inspect} is an invalid value. Should be at least one.")
      end

      if size < 1
        raise(ArgumentError, "#{size.inspect} is an invalid value. Should be at least one.")
      end

      if prob < 0 || prob > 1
        raise(ArgumentError, "#{prob.inspect} is an invalid value. Should be between 0 and 1.")
      end

      new { |graph| Bindings.igraph_watts_strogatz_game(graph, dim, size, nei, prob, loops, multiple) }
    end

    #
    # Frees memory allocated for the graph.
    #
    # @param [Graph] graph
    #   Graph instance to free.
    #
    def self.destroy(graph)
      Bindings.igraph_destroy(graph)
    end

    #
    # Checks if two graphs are identical.
    #
    # @param [Graph] other
    #   Graph to compare with.
    #
    # @return [Boolean]
    #
    def ==(other)
      result_pointer = FFI::MemoryPointer.new(:bool)
      Bindings.igraph_is_same_graph(self, other, result_pointer)
      result_pointer.read_uchar != 0
    end

    #
    # Creates a copy of a graph
    #
    # @param [Graph] graph
    #   Graph object to copy.
    #
    # @return [Graph]
    #   The graph instance with copied attributes.
    #
    def copy
      self.class.new { |new_graph| Bindings.igraph_copy(new_graph, self) }
    end

    #
    # Adds an edge to a graph.
    #
    # @param [Integer] from
    #   Id of the first vertex of the edge.
    #
    # @param [Integer] to
    #   Id of the second vertex of the edge.
    #
    def add_edge(from, to)
      Bindings.igraph_add_edge(self, from, to)
    end

    #
    # Counts number of edges in a graph.
    #
    # @return [Integer]
    #
    def edges_count
      Bindings.igraph_ecount(self)
    end

    #
    # Checks if the edge exists in the graph.
    #
    # @param [Integer] from
    #   Start point of the edge.
    #
    # @param [Integer] to
    #   End point of the edge.
    #
    # @param [Boolean] directed
    #   Indicates whether to search for directed edges
    #   in a directed graph.
    #
    def edge?(from, to, directed: false)
      eid = FFI::MemoryPointer.new(:int)
      Bindings.igraph_get_eid(self, eid, from, to, directed, false)
      eid.read_int >= 0
    end

    #
    # Count number of vertices in a graph.
    #
    # @return [Integer]
    #
    def vertices_count
      Bindings.igraph_vcount(self)
    end

    #
    # Indicates where the graph is directed.
    #
    # @return [Boolean]
    #
    def directed?
      Bindings.igraph_is_directed(self)
    end

    #
    # Adds a vertices to a graph.
    #
    # @param [Integer] number
    #   Number of vertices to add.
    #
    def add_vertices(number)
      if number < 0
        raise(ArgumentError, "#{number.inspect} is an invalid value. Must be positive.")
      end

      Bindings.igraph_add_vertices(self, number, nil)
    end

    #
    # Removes loops and/or multiple edges from the graph.
    #
    # @param [Boolean] multiple
    #   Indicates whether to remove multiple edges.
    #
    # @param [Boolen] loops
    #   Indicate whether to remove loops.
    #
    def simplify(multiple: true, loops: true)
      Bindings.igraph_simplify(self, multiple, loops, nil)
    end
  end
end
