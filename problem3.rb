# The prime factors of 13195 are 5, 7, 13 and 29.

# # What is the largest prime factor of the number 600851475143 ?

def largest_prime_factor(number)
  prime_factors(number)
  p @factor_array.last
end

def prime_factors(number)
  @check = number
  @prime_number = 0
  @number = number
  @factor_array = []
  @finished = false
  until @finished
    next_prime
    @factored = false
    until @factored 
      factor(@number)
    end
    finished?
  end
  return @factor_array
end

def factor(number)
  if number % @prime_number == 0
    @factor_array << @prime_number
    @number = number / @prime_number
  else
    @factored = true
  end
end

def next_prime
  @prime_number +=1
  while !is_prime(@prime_number)
    @prime_number +=1
  end
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

def finished?
  checker = 1
  @factor_array.length.times do |i|
    checker = @factor_array[i] * checker
  end
  if checker == @check
    @finished = true
  end
end

largest_prime_factor(600851475143)