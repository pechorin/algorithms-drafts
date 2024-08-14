def factorial(n)
  return 1 if n < 2

  factorial(n - 1) * n
end

puts factorial(17)
