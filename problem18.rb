require 'benchmark'

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
    solver(triangle_str)
  }
  puts time.real
end

def solver(triangle_str)
  triangle = convert_to_hash_map(triangle_str)
  column = 0
  update_node(triangle, column)
  answer = triangle.last.sort_by { |k| k['value'] }
  p answer.last['value']
  p answer.last['path'].reverse
end

def update_node(triangle, column)
  (triangle.length-1).times do
    row = 0
    triangle[column].each do |node|
      update_weights(triangle, column, row, node)
      row += 1
    end
    column +=1
  end
end

def update_weights(triangle,column,row, node)
  next_node = []
  next_node << triangle[column+1][row]
  next_node << triangle[column+1][row+1]
  if column == 0 && row == 0
    node['value'] = node['weight']
    node['path'][0] = node['value']
  end
  next_node.each do |n|
    if n['value'] <= (node['value'] + n['weight'])
      n['value'] = node['value'] + n['weight']
      n['path'] = []
      n['path'] << n['weight']
      node['path'].each do |v|
        n['path'] << v
      end
    end
  end
end


def convert_to_hash_map (triangle_str)
  t = triangle_str.each_line.map { |line| line.split.map(&:to_i) }
  triangle = []
  t.each do |a|
    tri =[]
    a.each do |b|
      h = {'weight'=>b, 'value'=> 0, 'path'=>[]}
      tri << h
    end
  triangle << tri
  end
  return triangle
end

start(triangle_str)
