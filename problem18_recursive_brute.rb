require 'benchmark'

triangle_str = File.open('./needed_files/18.txt').read

@array = []
@keys = []

def start(triangle_str)
  time = Benchmark.measure {
    runner(triangle_str)
  }
  puts time.real
end

def runner(triangle_str)
  triangle = convert_to_array(triangle_str)
  row = 0
  col = 0
  parse(triangle, row, col)
  answer = output_highest_route
  p answer
end

def parse(triangle, row, col)
  get_route(triangle, row, col)
end

def get_route(triangle, row, col)
  @array.push(triangle[row][col])
  next_node(triangle, row, col)
  @array.pop
end

def next_node(triangle,row, col)
  x = row + 1
  y = 0
  if triangle[x] == nil
    route_complete
    return
  end
  while y <= 1
    yoff = col + y
    get_route(triangle, x, (y + col))
    y += 1
  end
end

def route_complete
  a = []
  @array.each do |i|
    a << i
  end
  @keys << a
end

def output_highest_route
  current_highest = {'addition' => 0, 'route' => []}
  @keys.each do |key|
    temp = 0
    key.each do |value|
      temp += value
    end
    if temp >= current_highest["addition"]
      current_highest["addition"] = temp
      current_highest["route"] = key
    end
  end
  return current_highest
end

def convert_to_array(triangle_str)
  t = triangle_str.each_line.map { |line| line.split.map(&:to_i)  }
end

start(triangle_str)
