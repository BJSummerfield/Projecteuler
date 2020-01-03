require 'benchmark'

num = 10000

def start(num)
  time = Benchmark.measure {
    runner(num)
  }
  puts time.real
end

def runner(num)
  arr = []
  primes = []
  i = 0
  while i <= num
    next_num(num, primes, i, arr)
    i += 1
  end
  p arr.reduce(:+)
end

def next_num(num, primes, i, arr)
  if i >= 2
    if i * i < num
      is_prime?(i, primes)
    end
    first_number = factor_sum(primes,i)
    second_number = factor_sum(primes,first_number)
    check_match(first_number, second_number, i, arr)
  end
end

def check_match(first_number, second_number, i, arr)
  if second_number == i && first_number != second_number
    arr << second_number
  end
end

def factor_sum(primes,i)
  factors = []
  x = 0
  get_factors(primes, i, factors, x)
  number = get_divisors(factors)
end

def get_divisors(factors)
  sum = 0
  a = (1..(factors.length)).flat_map{|size| factors.combination(size).to_a}.uniq
  a.pop
  a.each do |combo|
    sum += combo.reduce(:*)
  end
  sum += 1
  return sum
end

def get_factors(primes, i, factors, x)
  return if i == 1
  if primes[x] == nil
    factors << i
    return
  end
  if i % primes[x] == 0
    i = i / primes[x]
    factors << primes[x]
    get_factors(primes, i, factors, x)
  else
    get_factors(primes,i, factors, x+1)
  end
end

def is_prime?(i, primes)
  return if i == 0
  return if i == 1
    primes.each do |prime|
      if i % prime == 0
        return
      end
    end
  primes << i
end

start(num)
