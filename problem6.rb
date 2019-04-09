#The sum of the squares of the first ten natural numbers is,

# 1^2 + 2^2 + ... + 102 = 385
# The square of the sum of the first ten natural numbers is,

# (1 + 2 + ... + 10)^2 = 55^2 = 3025
# Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

# Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

def sum_square_difference(number)
  sum_squares = []
  square_sum = []
  (number + 1).times do |i|
    square = (i * i)
    sum_squares << square
    square_sum << i
  end
   return p square_sum.inject(:+) * square_sum.inject(:+) - sum_squares.inject(:+)
end

sum_square_difference(100)
