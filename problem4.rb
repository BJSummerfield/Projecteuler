# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

# Find the largest palindrome made from the product of two 3-digit numbers.

f = 100
s = 100
a = []

while s < 1000 
  f = 100
  while f < 1000
    num_check = f * s
    a << num_check if num_check.to_s == num_check.to_s.reverse
    f += 1
  end
  s += 1
end

p a.sort.last