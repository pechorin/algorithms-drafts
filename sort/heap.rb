# frozen_string_literal: true

require './lib/algorithm_tracker'
require './trees/binary'

module Sort
  class Heap
    using AlgorithmTracker

    def call(list)
      return if list.size.zero?

      tree = Trees::Binary.new
      list.each { |e| tree.append(e) }

      tree.traverse_asc
    end
  end
end
