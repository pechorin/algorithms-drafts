# frozen_string_literal: true

require './lib/algorithm_bench.rb'

# (5,4,3,2,1)
#
# l: 5 - 1 = 4
#
# i1: n(0, l - 1) -> 4 5 3 2 1
# i1: n(0, l - 1) -> 4 3 5 2 1
# i1: n(0, l - 1) -> 4 3 2 5 1
# i1: n(0, l - 1) -> 4 3 2 1 5
# i2: n(0, l - 2) <- 4 3 1 2 5
# i2: n(0, l - 2) <- 4 1 3 2 5
# i2: n(0, l - 2) <- 1 4 3 2 5
# i3: n(1, l - 3) -> 1 3 4 2 5
# i3: n(1, l - 3) -> 1 3 2 4 5
# i4: n(?, l - 4) <- 1 2 3 4 5

class CoctailSort
  include AlgorithmBench

  def call(arr)
    puts "-> #{arr.inspect}"

    lp = 0 # left pointer
    rp = arr.length  # right pointer

    dir = :right

    while lp != rp
      puts "l:#{lp}(#{arr[lp]}) r:#{rp}(#{arr[rp]})"

      puts ">>"
      n = lp
      puts "start n = #{arr.length} - (#{arr.length} - #{rp})  == #{n}"
      while n < arr.length - (arr.length - rp)
        v = arr[n]
        v2 = arr[n + 1]

        break if v2 == nil

        if v > v2
          arr[n] = v2
          arr[n + 1] = v
        end

        puts "n[#{n}] = #{arr[n]} --> #{arr.inspect}"
        n += 1
      end

      rp -= 1

      puts "<<"
      n = arr.length - (arr.length - rp) - 1
      puts "start n = #{arr.length} - (#{arr.length} - #{rp}) - #{lp} == #{n}"
      while n > lp
        v = arr[n]
        v2 = arr[n - 1]

        break if v2 == nil

        if v < v2
          arr[n] = v2
          arr[n - 1] = v
        end

        puts "n[#{n}] = #{arr[n]} --> #{arr.inspect}"
        n -= 1
      end

      lp += 1

      dir = dir == :right ? :left : :right

      if lp + 1 == rp
        puts "-- will break"
        break
      end
    end

    puts stats.inspect

    arr
  end
end

puts CoctailSort.new.call([12, 20, 4,3,2,1,100,120,18,3,45]).inspect
# puts CoctailSort.new.call([5, 4, 3, 2, 1]).inspect
