require 'benchmark'

triangle_str = File.open('./needed_files/67.txt').read

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
