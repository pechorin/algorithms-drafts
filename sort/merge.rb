# frozen_string_literal: true

# 3 2 1
#
# 1. mp = 1
#    0-0 .. 1 .. 2-2
#
  # 2.

module Sort
  class Merge
    def call(list)
      return list if list.size < 2

      merge_sort(list, 0, list.size - 1)
    end

    private

    def merge_sort(list, lp, rp)
      # return [list[lp]] if (rp - lp).zero?

      mp    = (rp - lp + 1) / 2
      return [list[lp]] if mp < 2

      puts "[l:#{lp},r:#{rp},m:#{mp}] m(#{lp} - #{mp}) m(#{mp + 1} - #{rp})"

      left  = merge_sort(list, lp, mp)
      right = merge_sort(list, mp + 1, rp)


      return [left, right]
    end
  end
end

# puts Sort::Merge.new.call([10,9,8,7,4,3,20,10,30,20]).inspect
# puts Sort::Merge.new.call([4,3,2,1]).inspect
puts Sort::Merge.new.call([3,2,1]).inspect
