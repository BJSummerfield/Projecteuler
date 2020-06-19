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
  numbers = Array(1..number)
  primes = []
  get_primes_lower_than_number(numbers, primes)
  array = exponent_primes(primes, number)
  return get_answer(array)
end

def get_answer(array)
  answer = 1
  array.each do |number|
    answer *= number
  end
  return answer
end

def exponent_primes(primes, number)
  array = []
  primes.each do |prime|
    og_prime = prime
    exponent = 2
    number_exponent = 1
    until number_exponent >= number
      number_exponent = og_prime**exponent
      prime = number_exponent if number_exponent < number
      exponent +=1
    end
    array << prime
  end
  return array
end

def get_primes_lower_than_number(numbers,primes)
  numbers.each do |number|
    is_prime?(number,primes)
  end
end

def is_prime?(number, primes)
  return if number == 0
  return if number == 1
    primes.each do |prime|
      if number % prime == 0
        return
      end
    end
  primes << number
end

p smallest_multiple(20)
    

