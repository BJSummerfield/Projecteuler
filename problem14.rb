# The following iterative sequence is defined for the set of positive integers:

# n → n/2 (n is even)
# n → 3n + 1 (n is odd)

# Using the rule above and starting with 13, we generate the following sequence:

# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

# Which starting number, under one million, produces the longest chain?

# NOTE: Once the chain starts the terms are allowed to go above one million.

def collatz(limit)
  length = 0
  answer = ""
  i = 0
  
  limit.times do 
    count = 1
    i +=1
    j = i
    until j == 1 do
      if j % 2 == 0
        j /= 2
      else
        j = (3*j)+1
      end
      count +=1
    end
    if count >= length
      answer = "Starting number: #{i}, Number of terms: #{count}"
      length = count
    end
  end
  return answer
end

p collatz(1000000)