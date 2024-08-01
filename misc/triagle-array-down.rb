# frozen_string_literal: true

#
#    L = 5
#
#    * * * * *
#    - * * * -
#    - - * - -
#    - - - - -
#

l = 5
a = -1
b = l

r = []

l.times do |_i|
  r_line = []

  l.times do |j|
    r_line << if j <= a || j >= b
                '-'
              else
                '*'
              end
  end

  r << r_line

  a += 1
  b -= 1
end

r.each do |line|
  puts line.inspect
end
