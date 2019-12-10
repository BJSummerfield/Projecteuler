ones = {
  1 => 'one',
  2 => 'two',
  3 => 'three',
  4 => 'four',
  5 => 'five',
  6 => 'six',
  7 => 'seven',
  8 => 'eight',
  9 => 'nine'
}

tens = {
  10 => 'ten',
  11 => 'eleven',
  12 => 'twelve',
  13 => 'thirteen',
  14 => ones[4]+'teen',
  15 => 'fifteen',
  16 => ones[6]+'teen',
  17 => ones[7]+'teen',
  18 => ones[8]+'een',
  19 => ones[9]+'teen'
}

two_digit = {
  2 => 'twenty',
  3 => 'thirty',
  4 => 'fourty',
  5 => 'fifty',
  6 => 'sixy',
  7 => 'seventy',
  8 => 'eighty',
  9 => 'ninety'
}

three_digit = {
}
word = ''
i = 1
1000.times do
  if i.to_s.length == 1
    word += ones[i]
  elsif i.to_s.length == 2
    if tens.include?(i)
      word += tens[i]
    else
      if i.to_s.include?('0')
        word += two_digit[i.to_s[0].to_i]
      else
        word += two_digit[i.to_s[0].to_i]+" "+ones[i.to_s[-1].to_i]
      end
    end
  elsif i.to_s.length == 3
    x = ones[i.to_s[0].to_i] + ' hundred and '
    y = i.to_s[-2] + i.to_s[-1]
    if tens.include?(y.to_i)
      word += x + tens[y.to_i]
    else
      if y == '00'
        word += x.gsub(' and ', '')
      elsif y[0] == '0'
        word += x + ones[i.to_s[-1].to_i]
      else
        if y.include?('0')
          word += x + two_digit[y[0].to_i]
        else
          word += x + two_digit[y[0].to_i]+" "+ones[y[-1].to_i]
        end
      end
    end
  elsif i.to_s.length == 4
    word += ones[i.to_s[0].to_i] + ' thousand'
  end
  i += 1
end

p word.gsub(' ', '').length
