multiples = 0
1000.times do |i|
  if i % 3 == 0 || i % 5 == 0
    multiples += i
  end
end
p multiples