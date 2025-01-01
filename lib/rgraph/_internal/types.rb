require_relative "lib"

IGRAPH_INTEGER_T = :int # TODO: depends on whether igraph is 32-bit or 64-bit
IGRAPH_BOOL_T = :bool
IGRAPH_REAL_T = :float
IGRAPH_UINT_T = :uint64 # TODO: depends on whether igraph is 32-bit or 64-bit

# TODO: NOT IMPLEMENTED TYPES
IGRAPH_ES_T = :void
IGRAPH_VS_T = :void
IGRAPH_ASTAR_HEURISTIC_FUNC_T = :void
IGRAPH_BFSHANDLER_T = :void
IGRAPH_DFSHANDLER_T = :void
IGRAPH_CLIQUE_HANDLER_T = :void
IGRAPH_COMMUNITY_LEADING_EIGENVECTOR_CALLBACK_T = :void
IGRAPH_ISOCOMPAT_T = :bool
IGRAPH_ISOHANDLER_T = :bool
IGRAPH_ARPACK_FUNCTION_T = :void
IGRAPH_ERROR_T = :int
HANDLE_IGRAPH_ERROR_T = :void

BoolArray = []
IntArray = []
RealArray = []

MatrixLike = [[]]
MatrixIntLike = [[]]

VertexLike = :int
VertexPair = []
VertexSelector = []

EdgeLike = :int
EdgeSelector = []


module RGraph
  module Internal
    class Graph < FFI::Struct
      layout :n, :int,
             :directed, :bool,
             :from,     :int,
             :to,       :int,
             :oi,       :int,
             :ii,       :int,
             :os,       :int,
             :is,       :int,
             :attr,     :pointer
    end

    class Vector < FFI::Struct
      layout :stor_begin, :pointer,
             :stor_end, :pointer,
             :end, :pointer

      class << self
        def create(size)
          new { |vector| IgraphC.igraph_vector_init(vector, size) }
        end
      end
    end

    class VectorInt < FFI::Struct
      layout :stor_begin, :pointer,
             :stor_end, :pointer,
             :end, :pointer

      class << self
        def create(size)
          new { |vector| IgraphC.igraph_vector_int_init(vector, size) }
        end
      end
    end

    class VectorBool < FFI::Struct
      layout :stor_begin, :pointer,
             :stor_end, :pointer,
             :end, :pointer

      class << self
        def create(size)
          new { |vector| IgraphC.igraph_vector_bool_init(vector, size) }
        end
      end
    end
  end
end
