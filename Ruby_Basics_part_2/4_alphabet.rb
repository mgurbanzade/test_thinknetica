array_alphabet = ('A'..'Z').to_a
hash_alphabet = {}

array_alphabet.each.with_index(1) do |value, index|
  hash_alphabet["#{value}"] = index if value.match(/A|E|I|O|U/)
end

puts hash_alphabet
