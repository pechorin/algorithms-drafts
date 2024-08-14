# frozen_string_literal: true

require './lib/algorithm_tracker'

module Sort
  class Selection
    using AlgorithmTracker

    def call(x)
      return x if x.size < 2

      x.size.times do |i|
        min = x[i]
        min_idx = i

        n = i
        while n != x.size
          a = x[n]

          if a < min
            min = a
            min_idx = n
          end

          n += 1
        end

        old = x[i]
        x[i] = min
        x[min_idx] = old
      end

      x
    end
  end
end
