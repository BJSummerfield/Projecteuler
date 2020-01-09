require 'benchmark'
exponent = 5

def start(exponent)
  time = Benchmark.measure {
    runner(exponent)
  }
  puts time.real
end

def runner(exponent)
  limit = upper_limit(exponent)
  puts parse(exponent, limit)
end

def parse(exponent, limit)
  i = 2
  answer = 0
  while i <= limit
    if i == i.to_s.chars.map { |digit| digit.to_i ** exponent }.reduce(:+)
      answer += i
    end
    i += 1
  end
  return answer
end

def upper_limit(exponent)
  i = 1
  limit = false
  while limit == false
    max = ((9 ** exponent) * i)
     if max.to_s.length <= i
      limit = true
    end
    i += 1
  end
  return max
end

start(exponent)

