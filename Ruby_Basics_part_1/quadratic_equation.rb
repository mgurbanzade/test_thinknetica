puts "Последовательно введите 3 числа"

a = gets.chomp.to_f
b = gets.chomp.to_f
c = gets.chomp.to_f
d = (b ** 2) - (4 * a * c)

if d < 0
  puts "Дискриминант: #{d}, корней нет"

elsif d == 0
  x = (-b / (2 * a))
  puts "Дискриминант: #{d}, корень: #{x}"

else
  d_root = Math.sqrt(d)
  x1 = (-b + d_root) / (2 * a)
  x2 = (-b - d_root) / (2 * a)
  puts "Дискриминант: #{d}, корни: #{x1}, #{x2}"
end

