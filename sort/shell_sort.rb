# frozen_string_literal: true

require './lib/algorithm_tracker'

module Sort
  class Shell
    using AlgorithmTracker

    def call(list)
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

puts "Stats: #{AlgorithmTracker.stats}"
