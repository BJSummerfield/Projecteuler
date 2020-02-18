
def runner
  primes = []
  max = 1000000
  get_primes(primes, max)
  answer = consecutive_primes(primes, max)
  message(answer)
end

def message(answer)
  p "There are #{answer.length} consecutive primes"
  p "They add up to #{answer.reduce(:+)}"
end

def consecutive_primes(primes, max)
  highest = [0]
  primes.each do |start|
    run = []
    this_sum = 0
    this_prime = primes.index(start)
    ((primes.length - 1) - this_prime).times do |i|
      this_sum += primes[this_prime + i]
      run << primes[this_prime + i]
      if check_prime(primes, this_sum)
        if highest.length < run.length
          highest = []
          run.each do |num|
            highest << num
          end
        end
      end
    end
  end
  return highest
end

def get_primes(primes, max, sum = 0)
  answer = nil
  i = 0
  until sum >= max
    if i == 0 || i == 1
      i += 1
    elsif i == 2
      primes << i
      sum += i
      i += 1
    else
      if check_prime(primes, i)
        primes << i
        sum += i
      end
      i += 2
    end
  end
  return primes
end

def check_prime(primes, number)
  primes.each do |prime|
    if number % prime == 0
      return false
    end
  end
end

runner