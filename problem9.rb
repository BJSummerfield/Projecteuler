# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

# a2 + b2 = c2
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

c = 2
while c < 1000
  b = 2
  c += 1
  while b < c
    a = 1
    b += 1
    while a < b
      if a + b + c == 1000 && (a**2 + b**2) == c**2
        numbers = [a,b,c]
      end
      a += 1
    end
  end
end
p "a = #{numbers[0]} b = #{numbers[1]} c = #{numbers[2]}"
p "abc = #{numbers.inject(:*)}"