# frozen_string_literal: true

require './lib/algorithm_tracker'

module Sort
  class Merge
    using AlgorithmTracker

    def call(list)
      return list if list.size < 2

      merge_sort(list, 0, list.size - 1)
    end

    private

    def merge_sort(list, lp, rp)
      return [list[lp]] if lp == rp

      # TODO: вот это вычесление как-то проще может получить можно?
      mp = lp + (rp - lp + 1) / 2

      left  = merge_sort(list, lp, mp - 1)
      right = merge_sort(list, mp, rp)

      merge(left, right)
    end

    def merge(left, right)
      list = []

      while left.any? && right.any?
        if left[0] < right[0]
          list << left.shift
        elsif left[0] > right[0]
          list << right.shift
        else # оба равны, а это реальная ситуацция?
          right.shift
          list << left.shift
        end

        AlgorithmTracker.track_iteration
      end

      list.append(*left) if left.any?
      list.append(*right) if right.any?

      list
    end
  end
end
