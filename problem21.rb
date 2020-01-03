require 'benchmark'

def start(number)
  time = Benchmark.measure {
    runner(number)
  }
  puts time.real
end

def runner(number)
  amicable_nums = []
  number.times do |i|
    first = proper_divisors(i+1)
    second = proper_divisors(first)
    if second == i+1 && first != second
      unless amicable_nums.include?(second)
        amicable_nums << second
      end
    end
  end
  puts amicable_nums.inject(:+)
end



def proper_divisors(num)
  arr = []
  if num != nil
    (num - 1).times do |i|
      div = i + 1
      if num % div == 0
        arr << div
      end
    end
    return arr.inject(:+)
  end
end

start(10000)
