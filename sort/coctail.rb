# frozen_string_literal: true

require './lib/algorithm_tracker'

module Sort
  class Coctail
    T = AlgorithmTracker
    using T

    def call(arr)
      return arr if arr.size < 2

      lp = 0 # left pointer
      rp = arr.length # right pointer

      dir = :right

      while lp != rp
        T.track_iteration
        n = lp
        while n < arr.length - (arr.length - rp)
          T.track_iteration
          v = arr[n]
          v2 = arr[n + 1]
          break if v2.nil?

          if v > v2
            arr[n] = v2
            arr[n + 1] = v
          end
          n += 1
        end

        rp -= 1

        n = arr.length - (arr.length - rp) - 1
        while n > lp
          T.track_iteration
          v = arr[n]
          v2 = arr[n - 1]
          break if v2.nil?

          if v < v2
            arr[n] = v2
            arr[n - 1] = v
          end
          n -= 1
        end

        lp += 1

        dir = dir == :right ? :left : :right

        break if lp + 1 == rp
      end

      puts "\n"

      arr
    end
  end
end
