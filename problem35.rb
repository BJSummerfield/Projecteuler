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
  max = 1000000
  get_primes(primes, max)
  answer = check_permutation(primes, answer)
  p answer.length
end

def check_permutation(primes, answer)
  primes.each do |prime|
    check = true
    ps = prime.to_s.split("")
    if ps.length == 1
      answer << prime
    elsif check_non_prime_int(ps)
    else
      check = shift_prime_check(primes, ps)
      answer << prime if check == true
    end
  end
  return answer
end

def shift_prime_check(primes, ps, i = 1, check = true)
  until i == ps.length do 
    shifted = ps.rotate(i)
    if primes.include?(shifted.join("").to_i) == false
      check = false
      break
    end
    i += 1
  end
  return check
end

def check_non_prime_int(ps)
  array = ["2","4","5","6","8"]
  array.each do |s|
    if ps.include?(s)
      return true
    end
  end
  return false
end

def get_primes(primes, max, i = 0)
  until i > max
    if i == 0 || i == 1
      i += 1
    elsif i == 2
      primes << i
      i += 1
    else
      if is_prime?(primes, i)
        primes << i
      end
      i += 2
    end
  end 
  return primes
end

def is_prime?(primes, i)
  primes.each do |prime|
    if prime**2 > i 
      return true
    end
    if i % prime == 0
      return false
    end
  end
end

start