# frozen_string_literal: true

class FibonacciSequence
  def initialize
    @cache = [0, 1]
  end

  def call(n)
    seq = []

    i = 0
    while i < n
      seq << fibonacci(i)
      i += 1
    end

    seq
  end

  private

  def fibonacci(n)
    return @cache[n] if n < 2
    return @cache[n] if @cache[n]

    @cache[n] = fibonacci(n - 2) + fibonacci(n - 1)
  end
end

puts FibonacciSequence.new.call(100).inspect
