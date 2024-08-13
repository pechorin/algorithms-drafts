# frozen_string_literal: true

require './lib/algorithm_tracker'

module Sort
  class Insertion
    using AlgorithmTracker

    def call(x)
      1.upto(x.size - 1) do |n|
        n.downto(1) do |i|
          break if x[i - 1] <= x[i]

          x[i - 1], x[i] = x[i], x[i - 1]
        end
      end

      x
    end
  end

  # class Insertion2
  #   using AlgorithmTracker

  #   def call(x)
  #     x
  #   end
  # end
end

