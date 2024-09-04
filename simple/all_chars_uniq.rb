# frozen_string_literal: true

def all_chars_uniq?(str)
  i = 0
  while i < str.size - 2
    j = i + 1
    while j < str.size
      return false if str[i] == str[j]

      j += 1
    end

    i += 1
  end

  true
end

puts all_chars_uniq?('abcde')
puts all_chars_uniq?('abcdea')
puts all_chars_uniq?('abcdesa')
puts all_chars_uniq?('1234567890abcd')
