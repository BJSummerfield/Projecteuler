# The series, 11 + 22 + 33 + ... + 1010 = 10405071317.

# Find the last ten digits of the series, 11 + 22 + 33 + ... + 10001000.

def problem48
  answer = 0
  1000.times do |i|
    x = i + 1
    answer += x**x
  end
  return answer
end

p problem48