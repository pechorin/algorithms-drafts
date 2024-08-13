# frozen_string_literal: true

require './lib/algorithm_tracker'

module Sort
  class Bubble
    using AlgorithmTracker

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

  class Bubble2
    using AlgorithmTracker

    def call(x)
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
  end
end
