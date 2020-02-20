require 'benchmark'

def start
  time = Benchmark.measure {
    runner
  }
  puts time.real
end

def runner
  answer = []
  primes = []
  max = 10000
  get_primes(primes, max)
  primes = trim_primes(primes)
  check_sequence(primes, answer)
  p answer[1].join.to_i
end

def check_sequence(primes, answer, add = 3330)
  primes.each do |prime|
    prime_2 = prime + add
    prime_3 = prime_2 + add
    if primes.include?(prime_2) && primes.include?(prime_3)
      array = [prime, prime_2, prime_3]
      if check_permutation(array)
        answer << array
      end
    end
  end
  return answer
end

def check_permutation(array)
  permutations = Array(array[0].to_s.split("")).permutation.to_a
  if permutations.include?(array[1].to_s.split("")) && permutations.include?(array[2].to_s.split(""))
    return true
  end
  return false
end

def trim_primes(primes, length = 4)
  four_digit_primes = primes.reduce([]) do |memo, prime|
    if prime.to_s.length == length
      memo << prime
    end
    memo
  end
  return four_digit_primes
end

def get_primes(primes, max, i = 0)
  until i >= max
    if i == 0 || i == 1
      i += 1
    elsif i == 2
      primes << i 
    else
      if is_prime?(primes, i)
        primes << i
      end
    end
    i += 2
  end
  return primes
end

def is_prime?(primes, number)
  primes.each do |prime|
    if prime**2 > number
      return true
    end
    if number % prime == 0
      return false
    end
  end
end

start
