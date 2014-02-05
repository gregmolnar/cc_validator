require './lib/credit_card'
puts "Enter card number: "
while line = STDIN.gets
  break if line.chomp == 'quit'
  card = CreditCard.new(line)
  puts "#{card.type}: #{card.number} (#{(card.valid?) ? 'valid' : 'invalid'})"
  puts "Enter another card number or 'quit' to exit: "
end