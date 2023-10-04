x = [1,2,3,4,5]

i = 0
j = x.size
j2 = 0
r = []

while i <= x.size - 1
  puts "i: #{i}"

  while j > 0
    puts "\tj: #{j} j2: #{j2}"
    r[i] ||= []
    r[i][j2] = x[j - 1]

    j -= 1
    j2 += 1
  end

  j =  x.size
  j2 = 0
  i += 1
end

puts r.inspect
