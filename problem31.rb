require 'benchmark'

target = 200
coins = [200, 100, 50, 20, 10, 5, 2]

def start(target, coins)
  time = Benchmark.measure {
    puts "Brute Force Solution"
    runner(target, coins)
  }
  puts "Time to run:"
  puts time.real
  coins << 1
  coins = coins.reverse
  puts "*************"
  time = Benchmark.measure {
    puts "Dynamic Solution"
    dynamic(target, coins)
  }
  puts "Time to run:"
  puts time.real
end

def runner(target, coins)
  ways = 0
  i = 0
  a = target
  while a >= 0
    b = a
    while b >= 0
      c = b
      while c >= 0
        d = c
        while d >= 0
          e = d
          while e >= 0
            f = e
            while f >= 0
              g = f
              while g >= 0
                ways += 1
                g -= coins[i + 6]
              end
              f -= coins[i + 5]
            end
            e -= coins[i + 4]
          end
          d -= coins[i + 3]
        end
        c -= coins[i + 2]
      end
      b -= coins[i + 1]
    end
    a -= coins[i]
  end
  p ways
end

def dynamic(target, coins)
  ways = Array.new(target+1) { |i| i = 0  }
  ways[0] = 1
  i = 0
  while i < coins.length
    j = coins[i]
    while j <= target
      ways[j] += ways[j - coins[i]]
      j += 1
    end
    i += 1
  end
  p ways.last
end

start(target, coins)




