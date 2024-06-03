# frozen_string_literal: true

require "ffi"
require_relative "graph"

module RGraph
  #
  # FFI bindings
  #
  module Bindings
    extend FFI::Library
    ffi_lib :igraph

    # Graphs
    attach_function :igraph_empty,             [Graph.by_ref, :int, :bool], :void
    attach_function :igraph_full,              [Graph.by_ref, :int, :bool, :bool], :void
    attach_function :igraph_ring,              [Graph.by_ref, :int, :bool, :bool, :bool], :void
    attach_function :igraph_kary_tree,         [Graph.by_ref, :int, :int, :int], :void
    attach_function :igraph_star,              [Graph.by_ref, :int, :int, :int], :void
    attach_function :igraph_wheel,             [Graph.by_ref, :int, :int, :int], :void

    attach_function :igraph_add_edge,          [Graph.by_ref, :int, :int], :int
    attach_function :igraph_destroy,           [Graph.by_ref], :void
    attach_function :igraph_ecount,            [Graph.by_ref], :int
    attach_function :igraph_is_directed,       [Graph.by_ref], :bool

    # Vectors
    attach_function :igraph_vector_init,       [Vector.by_ref, :int], :void
    attach_function :igraph_vector_destroy,    [Vector.by_ref], :void
    attach_function :igraph_vector_init_array, [Vector.by_ref, :pointer, :int], :void
  end
end
