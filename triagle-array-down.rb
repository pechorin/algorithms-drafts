=begin

   L = 5

   * * * * *
   - * * * -
   - - * - -
   - - - - -

=end

l = 5
a = -1
b = l

r = []

l.times do |i|
  r_line = []

  l.times do |j|
    if j <= a || j >= b
      r_line << '-'
    else
      r_line << '*'
    end
  end

  r << r_line

  a += 1
  b -= 1
end

r.each do |line|
  puts line.inspect
end
