# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

#What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

# def smallest_multiple(z)
#   x = 0
#   complete = false
#   while complete == false
#     p "#{x} = x"
#     x += z
#     y = z
#     z.times do 
#       complete = true if y == 1
#       y -= 1 if x % y == 0 || break
#     end
#   end
#   return p x 
# end
# smallest_multiple(20)

def smallest_multiple(number)
  array = []
  number.times do |i|
    array<<i if is_prime(i)
  end
  array.length.times do |i|
    x = array[i] 
    exponent = 2
    z = 1
    until z >= number
      z = x**exponent
      array[i] = z if z < number
      exponent += 1
    end
  end
  answer = 1
  array.length.times do |i|
    answer *= array[i]
  end
  return answer
end

def is_prime(number)
  if number == 0 || number == 1 || number != 2 && number % 2 == 0
   return false 
  end
  (number - 1).times do |i|
    index = i+1
    if number % index == 0 && index != 1
      return false
    end
  end
  return true
end

p smallest_multiple(20)
    

