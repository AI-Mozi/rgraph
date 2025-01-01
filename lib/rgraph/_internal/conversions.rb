require_relative "types"
require_relative "lib"

def array_to_igraph_vector_t(arr)
end

def array_to_igraph_vector_int_t(arr)

end

def array_to_igraph_vector_bool_t(arr)

end

def vertex_pairs_to_igraph_vector_int_t(arr)
  result = RGraph::Internal::VectorInt.create(0)

  arr.each do |u, v|
    IgraphC.igraph_vector_int_push_back(result, u)
    IgraphC.igraph_vector_int_push_back(result, v)
  end

  result
end
