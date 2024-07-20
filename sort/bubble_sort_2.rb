# frozen_string_literal: true

require './lib/algorithm_tracker'

module Sort
  class Bubble
    using AlgorithmTracker

    def call(list)
      0.upto(list.size - 1) do |n|
        0.upto(list.size - n) do |n2|
          next if list[n2 + 1].nil?

          list[n2], list[n2 + 1] = list[n2 + 1], list[n2] if list[n2] > list[n2 + 1]
        end
      end

      list
    end
  end
end
