module Search
  class Binary
    def call(list, search_e)
      binary_search(list, list, search_e)
    end

    private

    def binary_search(original_list, list, search_e)
      return if original_list.size.zero?       # if list is empty
      return if search_e < original_list.first # if search_e out of scope
      return if search_e > original_list.last  # if search_e out of scope

      middle = (0 + (list.size - 1)) / 2

      if list[middle] == search_e # if found at middle
        return original_list.index(list[middle])
      elsif list.size == 2 && list[1] == search_e # if list is small (n = 2), middle checked, so check last one
        return original_list.index(list[1])
      elsif list.size == 2 # no found in small list? return
        return
      end

      if list[middle] < search_e
        binary_search(original_list, list[middle..], search_e)
      else
        binary_search(original_list, list[..middle], search_e)
      end
    end
  end
end

test_data = {
  [1, 2, 3, 4, 5] => (-1..6).to_a,
  [1, 2, 3, 4, 5, 10, 20, 30, 45, 77, 78, 89, 91, 92, 93, 100] => [100, 77, 78, -10, 45, 89]
}

test_data.each do |list, lookup_values|
  puts "search in: #{list}"

  lookup_values.each do |value|
    r = Search::Binary.new.call(list, value)

    puts "value: #{value} -> found at: #{r.inspect}"
  end
end
