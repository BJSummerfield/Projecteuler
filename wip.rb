require 'benchmark'
list = [1,2,3,4,5,6]
end_nodes = 3

def start(list, end_nodes)
  time = Benchmark.measure {
    puts "Brute_Force"
    brute_force(list)
  }
  puts "Completion Time"
  puts time.real
  puts ""
  time = Benchmark.measure {
    puts "Algo Solution"
    runner(list, end_nodes)
  }
  puts "Completion Time"
  puts time.real
end

def brute_force(list)
  list = list.permutation(3).to_a.permutation(3).to_a
  unique = []
  i = 0
  while i < (list.length)
    if list[i].flatten.uniq.length == 6
      if list[i].map { |x| x.reduce(:+) }.uniq.length == 1
        a = []
        b = []
        c = []
        check = true
        3.times do |j|
          a << list[i][j][0]
          b << list[i][j][1]
          c << list[i][j][2]
        end
        a.each do |first|
          if b.include?(first) || c.include?(first)
            check = false
          end
        end
        if a.uniq.length == 3 && b.uniq.length == 3 && c.uniq.length == 3
          if check == true
            unique << list[i]
          end
        end
      end
    end
    i += 1
  end

  sorted = []
  unique.each do |i|
    a = i.sort { |x,y| x[0] <=> y[0] }
    unless sorted.include?(a)
      sorted << a
    end
  end
  a = []
  sorted.each do |string|
    x = []
    x << string[0]
    if string[0][2] == string[1][1]
      x << string[1]
      x << string[2]
    else
      x << string[2]
      x << string[1]
    end
    a << x
  end
  p a.last.flatten.join
end

def runner(list, end_nodes)
  total = find_max(list, end_nodes)
  possible_routes = create_node_routes(list, end_nodes, total)
  poly = create_poly(end_nodes)
  answer = place_node(possible_routes, poly, total, end_nodes)
  p answer.flatten.join
end

def create_poly(end_nodes)
  return Array.new(end_nodes) { |x| x = Array.new(3) { |i| i = 0  }}
end

def place_node(possible_routes, poly, total, end_nodes)
  poly[0][0] = possible_routes[0].shift
  possible_routes[0] = possible_routes[0].sort.reverse
  poly[0][1] = possible_routes[0].shift
  poly[0][2] = possible_routes[0].shift
  possible_routes.shift
  possible_routes = possible_routes.sort {|x,y| x[0]<=>y[0]}.reverse
  (end_nodes-1).times do |i|
    fill_nodes(poly, possible_routes[i], total, i+1, possible_routes)
  end
  return poly
end

def fill_nodes(poly, route, total, i, possible_routes)
  if route[0] == poly[i - 1][0]
    route = possible_routes[i+1]
  end
  poly[i][0] = route[0]
  poly[i][1] = poly[i - 1][2]
  poly[i][2] = total - poly[i].reduce(:+)
  return poly
end

def create_node_routes(list, end_nodes, total)
  routes = []
  upper = Array.new(end_nodes) { |i| i = list[-(end_nodes-i)]}
  lower = Array(list[0]..list[-end_nodes - 1])
  upper.each do |k|
    lower.combination(2).to_a.each do |combo|
      sum = 0
      sum += k
      combo.each do |num|
        sum += num
      end
      if sum == total
        routes << [k, combo].flatten
      end
    end
  end
  return routes
end

def find_max(list, end_nodes)
  total = 0
  end_nodes.times do |i|
    total += list[-(end_nodes - i)] + (list[i]*2)
  end
  return total / end_nodes
end

start(list, end_nodes)
