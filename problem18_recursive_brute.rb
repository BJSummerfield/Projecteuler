require 'benchmark'

@array = []
@keys = []

triangle_str =
"75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23"

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
