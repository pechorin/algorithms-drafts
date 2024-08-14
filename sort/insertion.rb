# frozen_string_literal: true

require './lib/algorithm_tracker'

module Sort
  class Insertion
    using AlgorithmTracker

    def call(x)
      return x if x.size < 2

      1.upto(x.size - 1) do |n|
        n.downto(1) do |i|
          break if x[i - 1] <= x[i]

          x[i - 1], x[i] = x[i], x[i - 1]
        end
      end

      x
    end
  end

  class Insertion2
    using AlgorithmTracker

    def call(x)
      return x if x.size < 2

      i = 1
      while i < x.size
        j = i
        while j > 0 && x[j] > x[j - 1]
          x[j - 1], x[j] = x[j], x[j - 1]

          j -= 1
        end

        i += 1
      end

      x
    end
  end
end
