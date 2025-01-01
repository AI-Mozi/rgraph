# frozen_string_literal: true

require_relative "rgraph_old/version"
require_relative "rgraph_old/ffi"
require_relative "rgraph_old/graph"

require_relative "rgraph/_internal/functions"
require_relative "rgraph/graph"

#
# Module RGraph
#
module RGraph; end

empty_graph = RGraph::Graph.new
empty_graph.add_edges_g([[1,2], [3,4]])
