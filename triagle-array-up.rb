=begin

   L = 5

   - - * - -
   - - - - -

   Проблема определения центра массива

   - - * * - -               - - * - -
   - * * * * -               - * * * -
   * * * * * *               * * * * *
   * * * * * *               * * * * *

=end

l = 21

if l.even?
  a = (l / 2) - 1
  b = a + 1
else # if l = 5 for example
  a = l / 2
  b = a
end

puts "a: #{a}, b: #{b}"

f = []

l.times do
  r = []
  l.times do |i|
    if i >= a && i <= b
      r << '*'
    else
      r << '.'
    end
  end

  f << r

  a -= 1
  b += 1
end

f.each do |line|
  puts line.inspect
end
