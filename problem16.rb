# Problem 16
# 215 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

# What is the sum of the digits of the number 21000?

def problem16(number, power)
  x = number**power
  x = x.to_s.split("")
  answer = 0
  x.length.times do |i|
    answer += x[i].to_i
  end
  return answer
end

p problem16(2,1000)
