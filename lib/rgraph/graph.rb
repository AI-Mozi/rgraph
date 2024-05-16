# frozen_string_literal: true

require_relative "vector"

module RGraph
  #
  # Graph
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

    def self.empty(size, directed: false)
      new { |graph| Bindings.igraph_empty(graph, size, directed) }
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
