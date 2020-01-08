require 'benchmark'

def start
  time = Benchmark.measure {
    runner
  }
  puts time.real
end

def runner
  a = Array(2..100)
  answers = []
  a.each do |x|
    a.each do |y|
      answers << x**y
    end
  end
  p answers.uniq!.length
end

start

