require_relative 'triangle'

valid_count = 0
file = File.open('input.txt', 'r')

file.readlines.each do |line|
  triangle = Triangle.from_string(line)
  valid_count += 1 if triangle.is_valid?
end

puts "Valid Count #{valid_count}"
