# frozen_string_literal: true

# @return [nil, Array<Integer>] nil if not found
#                               array with start and finish char idx for found string
def find_string_match(source, part)
  result = []

  i = 0
  while i < source.size - part.size
    part.size.times do |j|
      if part[j] == source[i + j]
        result << i + j
      else
        result = [] and next
      end
    end

    i += 1

    break if result.size == part.size
  end

  result.any? ? [result.first, result.last] : nil
end

puts find_string_match('hello world', 'hello').inspect
puts find_string_match('the hello world', 'hello').inspect
puts find_string_match('abcde', 'bc').inspect
