puts "Как вас зовут?"
first_name = gets.chomp

puts "Какой у вас рост (см)?"
height = gets.chomp.to_i

if height - 110 < 0
  puts "Ваш вес уже оптимальный."
else
  puts "#{first_name}, ваш идеальный вес составляет #{height - 110} кг."
end