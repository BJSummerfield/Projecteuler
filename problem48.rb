def problem48
  answer = 0
  1000.times do |i|
    x = i + 1
    answer += x**x
  end
  return answer
end

p problem48