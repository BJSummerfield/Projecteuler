number = 1
last_number = 0
old_number = number
sum = 0
while 
  old_number = number
  number += last_number
  last_number = old_number
  if number > 4000000
    break
  elsif number % 2 == 0
    sum += number
  end
end