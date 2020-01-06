require 'benchmark'

number = 28213

def start(num)
  time = Benchmark.measure {
    runner(num)
  }
  puts time.real
end

def runner(number)
  num = 1
  primes = []
  abundant_numbers = []
  while num <= number
    if (num * num) <= number
      prime_list(num, primes)
    end
    divisors = factor_tree(num, primes)
    if check_abundant(num, divisors)
      find_abundant_sums(num, abundant_numbers)
    end
    num += 1
  end
  sums = sum_abundants(abundant_numbers)
  puts get_non_abundant_sums(sums, number)
end

def get_non_abundant_sums(sums, number)
  sums.uniq!
  answer = (1..number).reject { |number| sums.include? number}.reduce(:+)
end

def sum_abundants(abundant_numbers)
  i = 0
  sums = []
  abundant_numbers.each do |x|
    abundant_numbers[i..abundant_numbers.length].each do |y|
      sum = x + y
      sums << sum unless sum > 28213
    end
    i += 1
  end
  return sums
end

def find_abundant_sums(num, abundant_numbers)
  abundant_numbers << num
end

def check_abundant(num, divisors)
  if divisors.reduce(:+) > num
    return true
  else
    return false
  end
end

def factor_tree(num, primes)
  x = 0
  prime_factors = []
  factor_number(num, primes, x, prime_factors)
  divisors = find_divisors(prime_factors)
end

def find_divisors(prime_factors)
  divisors = []
  combinations = (1..(prime_factors.length)).flat_map{|size| prime_factors.combination(size).to_a}.uniq
  combinations.pop
  combinations.each do |combination|
    combination = combination.reduce(:*)
    divisors << combination
  end
  divisors << 1
  return  divisors
end

def factor_number(num, primes, x, prime_factors)
  return if num == 1
  if primes[x] == nil
    prime_factors << num
    return
  end
  if num % primes[x] == 0
    num = num / primes[x]
    prime_factors << primes[x]
    factor_number(num, primes, x, prime_factors)
  else
    factor_number(num, primes, x + 1 , prime_factors)
  end
end

def prime_list(num, primes)
  return if num == 1
  primes.each do |prime|
    if num % prime == 0
      return
    end
  end
  primes << num
end

start(number)

