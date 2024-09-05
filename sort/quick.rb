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

      # TODO: научиться складывать массивы по другому, как в других языках без метода flatten
      return [call(left), ref, call(right)].flatten
    end
  end

  class QuickLomuto
    using AlgorithmTracker

    def call(list)
      sort(list, 0, list.size - 1)

      list
    end

    def sort(list, lo, hi)
      return unless lo < hi

      pivot = partition(list, lo, hi)

      sort(list, lo, pivot - 1)
      sort(list, pivot + 1, hi - 1)
    end

    def partition(list, lo, hi)
      return list if list.size < 1

      pv = list[hi] # опорный элемент относительно которого будем сортировать
      i  = lo - 1   # индекс i стоит на последнем меньшем чем pivot элементе
      j  = lo       # текущий элемент для обмена


      while j < hi
        # Если текущий меньше опорного, то сдвигаем (обмениваем) его налево
        if list[j] < pv
          i += 1
          list[j], list[i] = list[i], list[j]
        end

        # Если текущий больше, то продолжаем увеличивать j, таким образом образуется вот такое "пространство" значений:
        # <i: меньшие элементы><j: большие элементы><...еще не пройденные элементы><pivot>
        j += 1
      end

      # Последний, и очень хитрый обмен, в базовом случае помещаем pivot на место i + 1 (между меньшими и большими относительно pivot элемента)
      list[i + 1], list[hi] = list[hi], list[i + 1]
      # NOTE: интересно наблюдать за этим обменом в разных случаях, например:
      #       [1,2]
      #       [4,6,5]

      hi
    end
  end
end
