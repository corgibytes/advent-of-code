require 'pry'

DEBUG = false
INFO = false
class DayNine
  MARKER_MATCHER = /(\(\d+x\d+\))/
  LENGTH_COUNT_MATCHER = /\((\d+)x(\d+)\)/

  def initialize(input_string)
    @member_variable = input_string
  end

  def result_length
    total_length = 0
    removed_marker_input = @member_variable.chomp
    puts "Input #{removed_marker_input}" if INFO
    puts "Length of Input: #{removed_marker_input.length}" if INFO

    @marker_count = 0
    while removed_marker_input.length > 0 do
      # Example Input (3x3)XYZ
      # Find Markers - Save elsewhere
      #   markers = ['(3x3)']
      binding.pry if DEBUG
      matched_marker = removed_marker_input.match(LENGTH_COUNT_MATCHER)
      if matched_marker.nil?
        binding.pry if DEBUG
        # Remove the last of the string w/o markers
        puts "Last of Input has no Marker" if INFO
        puts "Remaining Input: #{removed_marker_input}" if INFO
        puts "Remaining Input Chars: #{removed_marker_input.chars}" if INFO
        total_length += removed_marker_input.length
        puts "Total Length = #{total_length}" if INFO
        removed_marker_input = ''
      else
        # Remove Found Marker
        @marker_count += 1
        puts "Matched Marker (#{@marker_count}): #{matched_marker[0]}" if INFO
        index_of_marker = removed_marker_input.index(matched_marker[0])
        total_length += index_of_marker
        puts "Total Length = #{total_length}" if INFO
        if index_of_marker > 0
          puts removed_marker_input[0...index_of_marker] if INFO
        end
        removed_marker_input = removed_marker_input[index_of_marker..-1]
        puts "Removing Front: #{removed_marker_input}" if INFO
        removed_marker_input.sub!(matched_marker[0], '')
        puts "Removing Marker: #{removed_marker_input}" if INFO

        # Consume the next number_to_grab characters
        number_to_grab = matched_marker[1].to_i
        repeat_count = matched_marker[2].to_i

        total_length += number_to_grab * (repeat_count)
        ## Logic to Truncate
        #number_to_grab = removed_marker_input.length if removed_marker_input.length < number_to_grab
        #total_marker = number_to_grab * (repeat_count)
        puts "Number to grab: #{number_to_grab}" if INFO
        puts "Number    left: #{removed_marker_input.length}" if INFO
        #total_length += total_marker
        ## End Logic to Truncate
        
        puts "Total Length = #{total_length}" if INFO
        removed_marker_input = removed_marker_input[number_to_grab..-1]
        binding.pry if DEBUG
      end
    # Repeat until end of String
    end

    total_length
  end
end
