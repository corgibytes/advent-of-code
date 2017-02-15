class Triangle
  attr_reader :sides

  def self.from_string(sides_string)
    parsed_sides = sides_string.split(' ').map(&:to_i)
    Triangle.new(*parsed_sides)
  end

  def is_valid?
    sides[0] + sides[1] > sides[2]
    # Kamil thinks we need && with permutations
    #   Not needed for sorted sides
  end

  private
  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3].sort
  end
end
