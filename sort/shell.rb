# frozen_string_literal: true

require './lib/algorithm_tracker'

module Sort
  class Shell
    using AlgorithmTracker

    def call(x, distance_ratio: 2, debug: false)
      return x if x.size < 2

      dist = (x.size / distance_ratio).to_i

      while dist > 0
        debug && puts("dist: #{dist}")

        i = dist
        while i < x.size
          debug && puts("i: - #{i}")

          j = i - dist
          while j >= 0 && x[j] > x[j + dist]
            debug && puts("j: -- #{j}")

            x[j + dist], x[j] = x[j], x[j + dist]

            j -= dist
          end

          i += 1
        end

        dist = (dist / distance_ratio).to_i
      end

      x
    end
  end
end
