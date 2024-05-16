# frozen_string_literal: true

require "ffi"

module RGraph
  #
  # Vector
  #
  class Vector < FFI::Struct
    layout :stor_begin, :pointer,
           :stor_begin, :pointer,
           :end,        :pointer
  end
end
