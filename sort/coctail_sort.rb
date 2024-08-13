# frozen_string_literal: true

require './lib/algorithm_tracker'

module Sort
  class Coctail
    using AlgorithmTracker

    def call(arr)
      lp = 0 # left pointer
      rp = arr.length # right pointer

      dir = :right

      while lp != rp
        n = lp
        while n < arr.length - (arr.length - rp)
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
