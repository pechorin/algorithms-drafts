# frozen_string_literal: true

def evclid_nod(a, b)
  less, rem = a > b ? [b, a % b] : [a, b % a]
  rem.zero? ? less : evclid_nod(less, rem)
end

puts evclid_nod(2000, 150)
