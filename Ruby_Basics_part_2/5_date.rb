puts "День:"
day = gets.chomp.to_i

puts "Месяц:"
month = gets.chomp.to_i

puts "Год:"
year = gets.chomp.to_i

if day <= 0 || month <= 0 || year <= 0 || day > 31 || month > 12
  puts "Неверный формат. Попробуйте еще раз."
  return
end

def isLeap y
  if ((y % 4 == 0) && (y % 100 != 0)) || (y % 400 == 0)
    true
  else
    false
  end
end

months = {
  1 => 31,
  2 => 28,
  3 => 31,
  4 => 30,
  5 => 31,
  6 => 30,
  7 => 31,
  8 => 31,
  9 => 30,
  10 => 31,
  11 => 30,
  12 => 31
}

if isLeap year
  months[2] = 29
end

days = 0

months.each do |m, d|
  if m < month
    days += d
  end
end

result = "Порядковый номер даты составляет #{days += day}."

puts result
