# frozen_string_literal: true

require './lib/algorithm_tracker'

module Sort
  class QuickNonEffective
    using AlgorithmTracker

    def call(list)
      return list if list.size < 2

      ref   = list.first
      left  = list.select { |e| e < ref }
      right = list.select { |e| e > ref }

      return [call(left), ref, call(right)].flatten
    end
  end
end

puts Sort::QuickNonEffective.new.call([3,2,1,4,5,6,7,10,20]).inspect
