# frozen_string_literal: true

# @return [TrueClass, FalseClass]
def check_sorting(list)
  l = list[0]
  i = 1

  while i < list.size
    if l < list[i]
      l = list[i]
    else
      break false
    end

    i += 1
  end

  true
end
