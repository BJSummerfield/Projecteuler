# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

#What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

def smallest_multiple(x,z)
  x -= 1
  complete = false
  while complete == false
    x += z
    y = z
    p "#{x} = x"
    z.times do 
      complete = true if y == 1
      y -= 1 if x % y == 0 || break
    end
  end
  return p x 
end
smallest_multiple(1,20)


