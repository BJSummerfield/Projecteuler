puts (1..2000).flat_map { |a|
  (1..50).map do |b|
    [a.to_s + b.to_s + (a*b).to_s, a*b]
  end
}.select { |p|
  p[0].length == 9 && p[0].each_char.sort.join == "123456789"
}.map { |p| p[1] }.uniq.reduce(:+)

