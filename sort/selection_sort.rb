def selection_sort(x)
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

x = [13,5,43,2,3,3,2,4,10,6,1]

puts selection_sort(x).inspect
