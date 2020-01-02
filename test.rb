TRIANGLE = [
  [75],
  [95, 64],
  [17, 47, 82],
  [18, 35, 87, 10],
  [20,  4, 82, 47, 65],
  [19,  1, 23, 75,  3, 34],
  [88,  2, 77, 73,  7, 63, 67],
  [99, 65,  4, 28,  6, 16, 70, 92],
  [41, 41, 26, 56, 83, 40, 80, 70, 33],
  [41, 48, 72, 33, 47, 32, 37, 16, 94, 29],
  [53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14],
  [70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57],
  [91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48],
  [63, 66,  4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31],
  [ 4, 62, 98, 27, 23,  9, 70, 98, 73, 93, 38, 53, 60,  4, 23]
]

class Node
  attr_reader :value, :children

  def initialize(value: 0, children: [])
    @value = value
    @children = children
  end

  def left
    @children[0]
  end

  def right
    @children[1]
  end

  def self.parse(triangle)
    memo = Array.new(triangle.length) { [] }

    triangle.reverse.each_with_index do |row, row_index|
      row.each_with_index do |value, value_index|
        children = row_index > 0 ? memo[row_index - 1][(value_index)..(value_index + 1)] : []
        memo[row_index][value_index] = new(value: value, children: children)
      end
    end

    memo.last.last
  end
end

class Stack
  def initialize
    @list = []
  end

  def to_a
    @list
  end

  def add(element)
    @list.push(element)
  end

  def remove
    @list.pop
  end
end

def dfs(tree, store, path = [], largest_sum = 0)
  store.add(tree)

  if tree.children.empty?
    path = store.to_a.map(&:value)
    largest_sum = path.reduce(:+)
  else
    tree.children.each do |child|
      values, sum = dfs(child, store, path, largest_sum)

      if sum > largest_sum
        largest_sum = sum
        path = values
      end
    end
  end

  store.remove

  return [path, largest_sum]
end

root = Node.parse(TRIANGLE)

p dfs(root, Stack.new)
