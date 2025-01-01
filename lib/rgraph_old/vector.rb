# frozen_string_literal: true

require "ffi"

module RGraph
  #
  # Vector
  #
  class Vector < FFI::Struct
    attr_reader :pointer

    layout :stor_begin, :pointer,
           :stor_end,   :pointer,
           :end,        :pointer

    def initialize
      @pointer = FFI::MemoryPointer.new(Vector)
      yield self if block_given?
    end
    private :initialize

    #
    # Creates an empty vector.
    #
    # @param [Integer] size
    #   Size of the vector.
    #
    # @return [Vector]
    #   The Vector instace.
    #
    def self.null(size)
      new { |vector| Bindings.igraph_vector_init(vector, size) }
    end

    #
    # Creates a vector from array.
    #
    # @param [Array] data
    #   Array used to initialize a Vector.
    #
    # @return [Vector]
    #   The Vector instance.
    #
    def self.from_array(data)
      size = data.size
      data_memory_pointer = FFI::MemoryPointer.new(:int, size)
      data_memory_pointer.write_array_of_int(data)

      new { |vector| Bindings.igraph_vector_init_array(vector, data_memory_pointer, size) }
    end

    #
    # Destroys a vector object.
    #
    def destroy
      Bindings.igraph_vector_destroy(self)
    end
  end
end
