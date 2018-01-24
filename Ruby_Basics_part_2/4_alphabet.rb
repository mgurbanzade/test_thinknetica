i = 1
array_alphabet = ('A'..'Z').to_a
array_alphabet.unshift('можно читерить?')
hash_alphabet = {}

while i < array_alphabet.length do
  if array_alphabet[i].match(/A|E|I|O|U/)
    hash_alphabet["#{array_alphabet[i]}"] = array_alphabet.index("#{array_alphabet[i]}")
  end

  i += 1
end

puts hash_alphabet
