class DayNine
  def initialize(input_string)
    @member_variable = input_string
  end

  def result_length
    result.length
  end

  def result
    x_index = @member_variable.index('x')
    return @member_variable if x_index.nil?

    grouped = /(\(\d+x\d+\))/
    matched_markers = @member_variable.scan(grouped) # Array of arrays with the matching markers
    # Find index of each marker
    matched_markers.each do |marker|
      beginning_index_of_marker = @member_variable.index(marker.first)
    end
    # For Fifth Test Case skip markers - if index is within first matching pattern

    marker_match = /\((\d+)x(\d+)\)/
    number_of_characters, repeat_count = @member_variable.match(marker_match)

    bracket_index = x_index - 2
    new_string = @member_variable[0..bracket_index-1]
    repeat_count = @member_variable[x_index+1].to_i
    first_character_after_ending_bracket_index = x_index + 3
    remaining_character_index = x_index + 4

    repeat_count.times do
      new_string += @member_variable[first_character_after_ending_bracket_index]
    end

    new_string += @member_variable[remaining_character_index]
  end
end
