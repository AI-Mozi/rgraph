require_relative "_internal/functions"

module RGraph
  class Graph
    attr_reader :instance

    def initialize(*args, _wrap: nil)
      @instance = _wrap || empty(*args).instance
    end

    def add_edges_g(edges)
      add_edges(instance, edges) 
    end
  end
end
