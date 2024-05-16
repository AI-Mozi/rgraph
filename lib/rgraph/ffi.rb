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

    attach_function :igraph_empty,       [Graph.by_ref, :int, :bool], :void
    attach_function :igraph_add_edge,    [Graph.by_ref, :int, :int], :int
    attach_function :igraph_destroy,     [Graph.by_ref], :void
    attach_function :igraph_ecount,      [Graph.by_ref], :int
    attach_function :igraph_is_directed, [Graph.by_ref], :bool
  end
end
