num = 100
arr = []

while num > 0
  arr << num
  num -=1
end

p arr.inject(:*).to_s.split("").map(&:to_i).inject(:+)
