target = 200
coins = [1, 2, 5, 10, 20, 50, 100, 200]

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

dynamic(target, coins)
