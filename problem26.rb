p (0..1000).map { |d| (1..d).detect(lambda{0}) {|t| (10**t % d) == 1 }}.sort.last
