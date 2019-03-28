
i = 0
while i < 3
  p "while#{i}"
  i += 1 
end

i = -1
p("while_line#{i+=1}") while i < 2

i = 0
until i >= 3
  p "until#{i}"
  i += 1
end

for x in [1,2,3]
  p "for#{x}"
end


[1,2,3].each do |x|
  p "each#{x}"
end

for a,(b,c) in [[1,[2,3]], [4,[5,6]]]
  p "#{a}/#{b}/#{c}"
end

[[1,[2,3]],[4,[5,6]]].each do |a,(b,c)|
  p "#{a}/#{b}/#{c}"
end