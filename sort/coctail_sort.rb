# frozen_string_literal: true

class CoctailSort

  def call(arr)
    lp = 0 # left pointer
    rp = arr.length # right pointer

    dir = :right

    while lp != rp
      n = lp
      while n < arr.length - (arr.length - rp)
        v, v2 = arr[n], arr[n + 1]
        break if v2 .nil?

        arr[n], arr[n + 1] = v2, v if v > v2
        n += 1
      end

      rp -= 1

      n = arr.length - (arr.length - rp) - 1
      while n > lp
        v, v2 = arr[n], arr[n - 1]
        break if v2.nil?

        arr[n], arr[n - 1] = v2, v if v < v2
        n -= 1
      end

      lp += 1

      dir = dir == :right ? :left : :right

      if lp + 1 == rp
        break
      end
    end

    puts stats.inspect
    puts "\n"

    arr
  end
end

puts CoctailSort.new.call([1,2,3,4]).inspect
puts CoctailSort.new.call([1,2,3,2]).inspect
puts CoctailSort.new.call([5,4,3,2,1]).inspect
puts CoctailSort.new.call([12,20,4,3,2,1,100,120,18,3,45]).inspect
puts CoctailSort.new.call([12,20,4,3,2,1,100,120,18,3,45,67,54,321,12,1]).inspect
