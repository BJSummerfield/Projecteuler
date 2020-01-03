list = File.open('./needed_files/names.txt').read.scan(/\w+/).sort

puts list.map { |name|
  word_value = name.each_byte.map{ |c| c - 64}.reduce(:+)
  (list.index(name) + 1) * word_value }.reduce(:+)
