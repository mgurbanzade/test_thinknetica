puts "Последовательно введите 3 числа"

a = gets.chomp.to_f
b = gets.chomp.to_f
c = gets.chomp.to_f

d = (b ** 2) - (4 * a * c)

if d < 0
  puts "Дискриминант: #{d}, корней нет"
else
  x1 = (-b + Math.sqrt(d)) / 2 * a
  x2 = (-b - Math.sqrt(d)) / 2 * a

  if d == 0
    puts "Дискриминант: #{d}, корень: #{x1}"
  else
    puts "Дискриминант: #{d}, корни: #{x1}, #{x2}"
  end
end

