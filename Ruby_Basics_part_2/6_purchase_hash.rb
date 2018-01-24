check = {}
total_sum = 0

loop do
  puts "Название товара:"
  item_name = gets.chomp

  break if item_name.downcase == 'стоп' || item_name.downcase == 'stop'

  puts "Цена товара:"
  item_price = gets.chomp.to_f

  puts "Количество купленного товара:"
  item_quantity = gets.chomp.to_f

  check[item_name] = {
    price: item_price,
    quantity: item_quantity,
    item_total: item_price * item_quantity
  }
end

check.each do |key, value|
  puts "Итоговая сумма за товар #{key}: #{value[:item_total]}."
  total_sum += value[:item_total]
end

puts "Общая сумма: #{total_sum}."
