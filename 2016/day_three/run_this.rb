require_relative 'triangle'

valid_count = 0
file = File.open('input.txt', 'r')

input = file.readlines # Split file into lines
valid_count = input.map { |e| e.split(' ').map(&:to_i) } # Map Lines into Separate Arrays (Split)
  .each_slice(3) # Chunk Array into Smaller Arrays of Length 9 (chunk)
  .flat_map { |e| e[0].zip(e[1], e[2]) } # Zip every array with each other (zip)
  .map { |e| Triangle.new(*e) } # Flatten input (flatten)
  .map(&:is_valid?) # Map input to new triangle (map)
  .reject { |b| !b } # Reduce input to is_valid (reduce)
  .size

puts "Valid Count #{valid_count}"
