# frozen_string_literal: true

require './lib/algorithm_tracker'

# rubocop:disable Metric/MethodLength
module Sort
  # https://en.wikipedia.org/wiki/Comb_sort
  class Comb
    using AlgorithmTracker

    def call(list)
      return list if list.size < 2

      0.upto(list.size - 1) do |_|
        dist = list.size - 1

        while dist >= 1
          0.upto(list.size - 1) do |i2|
            v  = list[i2]
            v2 = list[i2 + dist]

            next if v2.nil?

            list[i2 + dist], list[i2] = list[i2], list[i2 + dist] if v > v2
            dist /= 1.25
          end
        end
      end

      bubble_sort(list)
    end

    def bubble_sort(list)
      return list if list.size < 2

      0.upto(list.size - 1) do |i|
        0.upto(list.size - i) do |i2|
          next if list[i2 + 1].nil?

          list[i2 + 1], list[i2] = list[i2], list[i2 + 1] if list[i2] > list[i2 + 1]
        end
      end

      list
    end
  end
end
# rubocop:enable Metric/MethodLength
