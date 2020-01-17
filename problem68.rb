# list = [1,2,3,4,5,6]
# list = list.permutation(3).to_a.permutation(3).to_a

# unique = []
# i = 0
# while i < (list.length)
#   if list[i].flatten.uniq.length == 6
#     if list[i].map { |x| x.reduce(:+) }.uniq.length == 1
#       a = []
#       b = []
#       c = []
#       check = true
#       3.times do |j|
#         a << list[i][j][0]
#         b << list[i][j][1]
#         c << list[i][j][2]
#       end
#       a.each do |first|
#         if b.include?(first) || c.include?(first)
#           check = false
#         end
#       end
#       if a.uniq.length == 3 && b.uniq.length == 3 && c.uniq.length == 3
#         if check == true
#           unique << list[i]
#         end
#       end
#     end
#   end
#   i += 1
# end


# sorted = []
# unique.each do |i|
#   a = i.sort { |x,y| x[0] <=> y[0] }
#   unless sorted.include?(a)
#     sorted << a
#   end
# end

# sorted.each do |string|
#   x = []
#   x << string[0]
#   if string[0][2] == string[1][1]
#     x << string[1]
#     x << string[2]
#   else
#     x << string[2]
#     x << string[1]
#   end
#   string = x
#   p string
# end
end_nodes = 3
list = [1,2,3,4,5,6]
def runner(end_nodes, list)
  total = find_max(end_nodes, list)
  populate_nodes(end_nodes,list, total)
end

def populate_nodes(end_nodes, list, total)
  max_nums = double_lower_nodes(list, end_nodes)
  array = create_nodes(end_nodes, list, total, max_nums)
  # p list
end

def create_nodes(end_nodes, list, total, max_nums)
  nodes = Array.new(end_nodes) { |i| i = [list[-(end_nodes - i)],0,0]}
  nodes.each do |node|
    remove_list(node, list)
  end
  routes = fill_nodes(nodes, list, total)
  nodes = node_fix(nodes, routes)
  complete_routes(nodes, list, total, routes)
end

def node_fix(nodes,route)
  arry = []
  (route.length).times do
    temp = []
    nodes.each do |node|
      tem = []
      node.each do |num|
        tem << num
      end
      temp << tem
    end
    arry << temp
  end
  return arry
end

def complete_routes(nodes, list, total, routes)

  i = 0
  nodes.each do |path|
    p path
    path[0][1] = routes[i][0]
    path[0][2] = routes[i][1]
    path[1][1] = routes[i][1]
    path[1][2] = total - path[1].reduce(:+)
    path[2][1] = path[1][2]
    path[2][2] = path[0][1]
    # path[i][1][2] = total - path[i][1].reduce(:+)
    # path[i][2][1] = total - path[i][2].reduce(:+)
    # path[i].each do |path|
    #   p path

    # end
    i += 1
  end
  p nodes
end

def fill_nodes(nodes,list, total)
  sum = total - nodes[0][0]
  routes = []
  list.each do |num|
    arry = []
    x = sum - num
    if list.include?(x) && num + x == sum
      arry << num
      arry << x
      routes << arry
    end
  end
  return routes
end

def remove_list(node, list)
  node.each do |num|
    if list.include?(num)
      list.delete(num)
    end
  end
  return list
end

def double_lower_nodes(list, end_nodes)
  arry = []
  list.each do |num|
    arry << num
  end
  end_nodes.times do |i|
    arry << list[i]
  end
  return arry
end

def find_max(end_nodes, list)
  total = 0
  j = end_nodes
  inner = (list.length) - end_nodes
  inner.times do |i|
    total += (list[i] * 2)
    total += list[j]
    j += 1
  end
  return total / end_nodes
end

runner(end_nodes, list)
