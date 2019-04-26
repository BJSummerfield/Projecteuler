# Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.


# How many such routes are there through a 20×20 grid?

def problem15(side_length)
  routes = 1
  i = 1
  while i <= side_length
    routes = (routes * (side_length + i) / i)
    i += 1
  end
  return routes
end

p problem15(20)


