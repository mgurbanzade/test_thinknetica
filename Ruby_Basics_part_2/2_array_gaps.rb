current = 10
step = 5
finish = 100
some_array = [current]

while current < finish do
  current += step
  some_array.push(current)
end

puts some_array

