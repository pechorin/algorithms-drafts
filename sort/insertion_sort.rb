# frozen_string_literal: true

def insertion_sort(x)
  1.upto(x.size - 1) do |n|
    n.downto(1) do |i|
      break if x[i - 1] <= x[i]

      x[i - 1], x[i] = x[i], x[i - 1]
    end
  end

  x
end

x = [13, 5, 43, 2, 3, 3, 2, 4, 10, 6, 1]

puts insertion_sort(x).inspect
