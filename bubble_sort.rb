=begin

   a = 3,2,1

   i1: 2,3,1  2,1,3

   i2: 1,2,3

   --

   a = 4,3,8,1,2

   (0 .. a.len - 1)

   i1: 3,4,8,1,2   3,4,1,8,2   3,4,1,2,8

   (0 .. a.len - 1 - (iter count))

   i2:  3,1,4,2,8  3,1,2,4,8

   i3: 1,3,2,4,8   1,2,3,4,8

=end

x = [4,3,8,1,2,5,33,88,11,2]

x.size.times do |g|
  (x.size - g).times do |i|
    i2 = i + 1
    next if x[i2].nil?

    v_i = x[i]
    v_i2 = x[i2]

    if v_i > v_i2
      x[i] = v_i2
      x[i2] = v_i
    end
  end
end

puts x.inspect
