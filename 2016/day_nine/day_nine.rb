require 'pry'

DEBUG = false
class DayNine
  MARKER_MATCHER = /(\(\d+x\d+\))/
  LENGTH_COUNT_MATCHER = /\((\d+)x(\d+)\)/

  def initialize(input_string)
    @member_variable = input_string
  end

  def result_length
    total_length = 0
    removed_marker_input = @member_variable

    while removed_marker_input.length > 0 do
      # Example Input (3x3)XYZ
      # Find Markers - Save elsewhere
      #   markers = ['(3x3)']
      binding.pry if DEBUG
      matched_marker = removed_marker_input.match(LENGTH_COUNT_MATCHER)
      if matched_marker.nil?
        binding.pry if DEBUG
        # Remove the last of the string w/o markers
        total_length += removed_marker_input.length
        removed_marker_input = ''
      else
        # Remove Found Marker
        index_of_marker = removed_marker_input.index(matched_marker[0])
        total_length += index_of_marker
        removed_marker_input = removed_marker_input[index_of_marker..-1]
        removed_marker_input.sub!(matched_marker[0], '')

        # Consume the next number_to_grab characters
        number_to_grab = matched_marker[1].to_i
        repeat_count = matched_marker[2].to_i
        total_length += number_to_grab * (repeat_count)
        removed_marker_input = removed_marker_input[number_to_grab..-1]
        binding.pry if DEBUG
      end
    # Repeat until end of String
    end

    total_length
  end
end
