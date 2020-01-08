require 'benchmark'

def start
  time = Benchmark.measure {
    runner
  }
  puts time.real
end

def runner
  num = 1000
  i = 1
  j = 0
  x = [1,2]
  answer = 0
  while i <= num
    a = (1..i).detect { |x| (10**x % i) == 1}
    if a
      if a > answer
        answer = a
      end
    end
    if j == 2
      j = 0
    end
    i += x[j]
    j += 1
  end
  p answer
end

start
