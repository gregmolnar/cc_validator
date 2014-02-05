require 'credit_card'
puts "Enter card number : "
while line = STDIN.gets
  break if line.chomp == 'quit'
  puts "Enter another card number or 'quit' to exit : "
end