# frozen_string_literal: true

module RGraph
  module Bindings
    #
    # C stdlib bindings.
    #
    module C
      extend FFI::Library
      ffi_lib FFI::Library::LIBC

      attach_function :fopen,  [:string, :string], :pointer
      attach_function :fclose, [:pointer], :int
    end
  end
end
