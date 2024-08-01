# frozen_string_literal: true

require 'prime'

def sieve_of_eratosthenes(n)
  result = 0.upto(n).map { |i| i < 2 ? false : true }

  2.upto(n) do |i|
    next result[i] = false unless i.prime?

    j = i + i # следующее кратное число

    while j <= n
      result[j] = false unless j.prime?

      j = j + i
    end
  end

  primes = []
  result.each_with_index { |v, idx| primes << idx if v }

  primes
end

puts sieve_of_eratosthenes(200).inspect
