# frozen_string_literal: true

require './lib/algorithm_tracker'

module Sort
  # https://en.wikipedia.org/wiki/Comb_sort
  class Comb
    using AlgorithmTracker

    def call(list)
      0.upto(list.size - 1) do |i|
        dist = list.size - 1

        while dist >= 1
          0.upto(list.size - 1) do |i2|
            v  = list[i2]
            v2 = list[i2 + dist]

            next if v2.nil?

            list[i2 + dist], list[i2] = list[i2], list[i2 + dist] if v > v2
            dist = dist / 1.25
          end
        end
      end

      puts "Comb result: #{list.inspect}"
      puts "Stats: #{$stats}"

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

[
  # [30, 11, 3, 2, 1, 109, 90, 4, 5, 10],
  # [10, 20, 5, 4, 2, 10, 12, 10],
  [10, 1, 2, 3]
].each do |list|
  puts "Sort result for: #{list}\n#{Sort::Comb.new.call(list)}"
end

puts "Stats: #{$stats}"
