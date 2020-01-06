require 'benchmark'
def start
  time = Benchmark.measure {
    solve
  }
  puts time.real
end

def solve
  numbers = Array(0..9)
  num = 1000000
  a = numbers.permutation.to_a
  p a[num -1].join
  p a[0..5]
end

start
