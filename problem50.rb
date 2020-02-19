require 'benchmark'

def start
  time = Benchmark.measure {
    runner
  }
  puts time.real
end

def runner
  primes = []
  answer = {"sum" => 0, "length" => 0}
  max = 1000000 
  get_primes(primes, max)
  consecutive_primes(primes, max, answer)
  message(answer)
end

def message(answer)
  p "There are #{answer['length']} consecutive primes that add up to #{answer['sum']}"
end

def consecutive_primes(primes, max, answer)
  index_primes = (primes.length - 1) 
  index_primes.times do |i|
    count = 0
    current_primes = primes[i..index_primes]
    current_primes.reduce(0) do |memo, prime|
      memo += prime
      break if memo > max
      count += 1
      if is_prime?(primes,memo)
        if count > answer['length']
          answer['length'] = count
          answer['sum'] = memo
        end
      end
      break if current_primes.length < answer['length']
      memo
    end
  end
  return answer
end

def get_primes(primes, max, sum = 0, answer = nil, i = 0)
  until sum >= max
    if i == 0 || i == 1
      i += 1
    elsif i == 2
      primes << i
      sum += i
      i += 1
    else
      if is_prime?(primes, i)
        primes << i
        sum += i
      end
      i += 2
    end
  end
  return primes
end

def is_prime?(primes, number)
  primes.each do |prime|
    if number % prime == 0
      return false
    end
  end
  return true
end

start