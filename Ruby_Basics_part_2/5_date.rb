puts "День:"
day = gets.chomp.to_i

puts "Месяц:"
input_month = gets.chomp.to_i

puts "Год:"
year = gets.chomp.to_i

def isLeap y
  ((y % 4 == 0) && (y % 100 != 0)) || (y % 400 == 0)
end

if day <= 0 || input_month <= 0 || year <= 0 || day > 31 || input_month > 12 ||
  (!isLeap(year) && input_month == 2 && day > 28) || (isLeap(year) && input_month == 2 && day > 29)

  puts "Неверный формат. Попробуйте еще раз."
  return
end

months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

months[1] = 29 if isLeap year

month = 0
days = 0

while month < input_month - 1
  days += months[month]
  month += 1
end

days += day

result = "Порядковый номер даты составляет #{days}."

puts result
