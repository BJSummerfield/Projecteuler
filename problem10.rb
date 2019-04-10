# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17

# Find the sum of all the primes below two million.

def prime_sum(number)
  primes = [2]
  count = 3
  while count < number
    p count
    primes << count if primes.all? {|prime_number| count % prime_number > 0 }
    count += 2
  end
  primes.inject(:+)
end

p prime_sum(2000000)