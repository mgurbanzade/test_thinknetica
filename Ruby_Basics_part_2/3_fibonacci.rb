i = 2
fibonacci = [0, 1]

loop do
  fibonacci[i] = fibonacci[i - 1] + fibonacci[i - 2]
  i += 1

  if fibonacci.last > 100
    fibonacci.pop
    break
  end
end

puts fibonacci

