# frozen_string_literal: true

module Sort
  class Bubble
    def call(list)
      0.upto(list.size - 1) do |n|
        0.upto(list.size - n) do |n2|
          next if list[n2 + 1].nil?

          list[n2], list[n2 + 1] = list[n2 + 1], list[n2] if list[n2] > list[n2 + 1]
        end
      end

      list
    end
  end
end

[
  [3, 2, 1],
  [10, 20, 5, 4, 2, 10, 12, 10],
  [10, 1, 2, 3]
].each do |list|
  puts "Sort result for: #{list}\n#{Sort::Bubble.new.call(list)}"
end
