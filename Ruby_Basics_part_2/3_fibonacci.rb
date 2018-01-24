fibonacci = [0, 1]

while fibonacci[-1] < 100 do
  fibonacci << fibonacci[-1] + fibonacci[-2]
end

fibonacci.pop
puts fibonacci
