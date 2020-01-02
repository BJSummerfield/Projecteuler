year = 1900

months = [
  31,
  28,
  31,
  30,
  31,
  30,
  31,
  31,
  30,
  31,
  30,
  31
]

week_day = [
  1,
  2,
  3,
  4,
  5,
  6,
  7
]

@sundays = []

def sunday_check(year, months, week_day)
  date = set_start(year, months, week_day)
  parse_years(date, year, months, week_day)
  puts @sundays
  puts @sundays.length
end

def parse_years(date, year, months, week_day)
  while date["y"] <= 2000
    date['m'] = 0
    parse_months(date,months, week_day)
    date['y'] += 1
  end
end

def parse_months(date, months, week_day)
  while date["m"] <= 11
    parse_days(date, months, week_day)
    date["m"] += 1
  end
end

def parse_days(date, months, week_day)
  leap = check_leap_year(date,months,week_day)
  date["d"] = 1
  while date["d"] <= (months[date['m']] + leap)
    if date['w'] > week_day.last
      date['w'] = week_day.first
    end
    check_sunday(date)
    date['w'] += 1
    date["d"] += 1
  end
end

def check_leap_year(date,months,week_day)
  if date['y'] % 4 == 0 && date['m'] == 1
    return 1
  else
    return 0
  end
end

def check_sunday(date)
  if date["d"] == 1 && date["w"] == 1 && date['y'] >= 1901
    n = "Sunday, #{date['m'] + 1}/#{date['d']}/#{date['y']}"
    @sundays << n
  end
end


def set_start(year, months, week_day)
  date = {"d" => 1, "w" => 2, "m" => 1, "y" => year}
  return date
end

sunday_check(year, months, week_day)
