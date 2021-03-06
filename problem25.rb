fib = []
num = 1
check = 1000

require 'benchmark'
def start(fib,num,check)
  time = Benchmark.measure {
    runner(fib,num,check)
  }
  puts time.real
end

def runner(fib, num, check)
  until num.to_s.length == check
    add_to_fib(fib, num)
    num = fib.last
  end
  p fib.length
end

def add_to_fib(fib, num)
  if fib[-1] == nil || fib[-2] == nil
    fib << num
  else
    fib << fib[-1] + fib[-2]
  end
end

start(fib,num,check)

