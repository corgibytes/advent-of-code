require 'pry'

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
