require 'benchmark'
number = 1001

def start(number)
  time = Benchmark.measure {
    runner(number)
  }
  puts time.real
end

def runner(number)
  i = 1
  grid = create_grid(number)
  start = find_start(number)
  grid = fill_grid(grid,start,start,i, number)
  answer = add_diagonals(grid)
  p answer
end

def add_diagonals(grid)
  answer = 0
  answer = add_right(grid, answer)
  answer = add_left(grid, answer)
  return answer -= 1
end

def add_left(grid, answer)
  y = (grid.length)-1
  x = 0
  while x < grid.length
    answer += grid[x][y]
    y-=1
    x+=1
  end
  return answer
end

def add_right(grid, answer)
  x = 0
  while x < grid.length
    answer += grid[x][x]
    x += 1
  end
  return answer
end

def fill_grid(grid, x, y, i, number)
  grid[x][y] = i
  while i < number*number
    i += 1
    move = check_next(grid,x,y,i)
    x = move[0]
    y = move[1]
    grid[x][y] = i
  end
  return grid
end

def check_next(grid, x, y, i)
  if check_first(i)
    move = [x, y+1]
  elsif check_down(grid, x, y)
    move = [x+1, y]
  elsif check_left(grid, x, y)
    move = [x, y-1]
  elsif check_up(grid, x, y)
    move = [x-1, y]
  elsif check_right(grid, x, y)
    move = [x, y+1]
  end
  return move
end

def check_right(grid,x,y)
  if y != grid[x].length
    if grid[x][y+1] == nil
     return true
    end
  end
end

def check_up(grid,x,y)
  if grid[x][y+1] != nil && grid[x-1][y] == nil
    return true
  end
end

def check_left(grid,x,y)
  if x != 0
    if grid[x][y-1] == nil && grid[x-1][y] != nil
      return true
    end
  end
end

def check_down(grid,x,y)
  return false if grid[x][y-1] == nil || grid[x+1] == nil
  if grid[x][y-1] != nil && grid[x+1][y] == nil
    return true
  end
end

def check_first(i)
  if i == 1
    return true
  end
end

def find_start(number)
  i = 3
  j = 1
  until i >= number
    i+=2
    j +=1
  end
  return j
end

def create_grid(number)
  grid = []
  number.times do
    grid << Array.new(number) {|i| i = nil}
  end
  return grid
end

start(number)
