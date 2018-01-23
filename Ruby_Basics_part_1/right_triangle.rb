puts "Поочередно укажите значения сторон треугольника:"

sides = [gets.chomp.to_i, gets.chomp.to_i, gets.chomp.to_i]
sides = sides.sort

if sides[0] == sides[1] && sides[0] == sides[2]
  puts "Треугольник не является прямоугольным. Он равнобедренный и равносторонний"
end

cathethus_a = sides[0]
cathethus_b = sides[1]
hypotenuse = sides[2]


if (cathethus_a ** 2 + cathethus_b ** 2) == hypotenuse ** 2
  puts "Треугольник является прямоугольным."

  if (cathethus_a == cathethus_b && 2 * (cathethus_a ** 2) == hypotenuse ** 2)
    puts "Треугольник является прямоугольным и равнобедренным."
  end

else
  puts "Треугольник не является прямоугольным."
end