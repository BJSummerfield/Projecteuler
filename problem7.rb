# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

#What is the 10 001st prime number?

# def prime_count(number)
#   array = []
#   i = 1
#   until array.length == number
#     array << i if is_prime(i)
#     i += 1
#   end
#   p array
#   return array.last
# end



# def is_prime(number)
#   if number == 0 || number == 1 || number != 2 && number % 2 == 0
#    return false 
#   end
#   (number - 1).times do |i|
#     index = i+1
#     if number % index == 0 && index != 1
#       return false
#     end
#   end
#   return true
# end

# p prime_count(10001)

def prime_at(number)
  primes = [2]
  count = 3
  until primes.length == number
    primes << count if primes.all? {|prime_number| count % prime_number > 0 }
    count += 1
  end
  primes.last
end

p prime_at(10001)