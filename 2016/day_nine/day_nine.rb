require 'pry'

class DayNine
  def initialize(input_string)
    @member_variable = input_string
  end

  def result_length
    # Example Input (3x3)XYZ
    # Find Markers - Save elsewhere
    #   markers = ['(3x3)']
    marker_matcher = /(\(\d+x\d+\))/
    markers = @member_variable.scan(marker_matcher)

    # Delete the Markers from String
    #   input = XYZ
    no_marker_input = @member_variable
    markers.each do |marker|
      no_marker_input.gsub!(marker.first, '')
    end

    #
    # Count length w/o markers
    #   total_length = input.length # 3
    total_length = no_marker_input.length

    #
    # Loop through Markers
    #   total_length += number_to_grab x (repeat_count - 1) # 3 + 3x2 => 9
    length_count_matcher = /\((\d+)x(\d+)\)/
    markers.each do |marker|
      counting_matches = marker.first.match(length_count_matcher)
      number_to_grab = counting_matches[1]
      repeat_count = counting_matches[2]
      total_length += number_to_grab.to_i * (repeat_count.to_i - 1)
    end

    total_length
  end
end
