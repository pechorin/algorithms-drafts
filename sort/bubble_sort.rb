# frozen_string_literal: true

def bubble_sort(x)
  x.size.times do |g|
    (x.size - g).times do |i|
      i2 = i + 1
      next if x[i2].nil?

      v_i = x[i]
      v_i2 = x[i2]

      if v_i > v_i2
        x[i] = v_i2
        x[i2] = v_i
      end
    end
  end

  x
end

x = [4, 3, 8, 1, 2, 5, 33, 88, 11, 2]
puts bubble_sort(x).inspect
