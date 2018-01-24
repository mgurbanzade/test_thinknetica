array_alphabet = ('A'..'Z').to_a
hash_alphabet = {}

array_alphabet.each_with_index do |value, index|
  hash_alphabet["#{value}"] = index + 1 if value.match(/A|E|I|O|U/)
end

puts hash_alphabet
