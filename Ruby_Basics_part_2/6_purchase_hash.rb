check = {}
item_total = {}
total_sum = 0

loop do
  puts "Название товара:"
  item_name = gets.chomp

  if item_name.downcase == 'стоп' || item_name.downcase == 'stop'
    break
  end

  puts "Цена товара:"
  item_price = gets.chomp.to_f

  puts "Количество купленного товара:"
  item_quantity = gets.chomp.to_f

  check[item_name] = {
    'Цена за ед.' => item_price,
    'Кол-во купленного товара' => item_quantity
  }
end

check.each do |key, value|
  item_total[key] = value['Цена за ед.'] * value['Кол-во купленного товара']
end

item_total.each do |key, value|
  total_sum += value
end

puts "Итоговая сумма за товар: #{item_total}."
puts "Общая сумма за все товары: #{total_sum}."



