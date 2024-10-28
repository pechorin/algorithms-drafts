def dragons_power(total_power)
  last_power    = total_power.to_f
  current_heads = 2
  result        = []
  finished      = false

  while finished != true
    if current_heads >= total_power
      result << current_heads
      finished = true
      break
    end

    div = last_power / current_heads

    if Integer(div) == div # проверяем что нет остатка
      result << current_heads
      last_power = div

      if div <= current_heads
        result << div.to_i
        finished = true
      else
        current_heads += 1
      end

    else
      current_heads += 1
    end
  end

  result
end

puts dragons_power(60).inspect # => [2, 3, 5, 2]
puts dragons_power(80).inspect # => [2, 4, 5, 2]
puts dragons_power(81).inspect # => [3, 9, 3]
puts dragons_power(2).inspect  # => [2]
puts dragons_power(3).inspect  # => [3]
puts dragons_power(4).inspect  # => [2, 2]
puts dragons_power(12).inspect # => [2, 3, 3]
