# The sequence of triangle numbers is generated by adding the natural numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:

# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

# Let us list the factors of the first seven triangle numbers:

#  1: 1
#  3: 1,3
#  6: 1,2,3,6
# 10: 1,2,5,10
# 15: 1,3,5,15
# 21: 1,3,7,21
# 28: 1,2,4,7,14,28
# We can see that 28 is the first triangle number to have over five divisors.

# What is the value of the first triangle number to have over five hundred divisors?
@triangles = [1]
@i = 2
@factors = []

def triangle_number
  @triangles << (@i + @triangles.last)
  @i += 1
end

def problem12
  until @factors != nil && @factors.length > 500 
    p @triangles.last
    triangle_number
    factor
  end
  return @triangles.last
end

def factor
  @factors = []
  divisor = 1
  highest = @triangles.last
  while divisor < highest
    if @triangles.last % divisor == 0
      highest = @triangles.last / divisor
      if divisor == highest
        @factors << divisor
      else
        @factors << divisor
        @factors << highest
      end
    end
    divisor += 1
  end
end

p problem12