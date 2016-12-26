require 'rspec'
require_relative 'day_nine_part_two'

describe DayNinePartTwo do
  # ADVENT contains no markers and decompresses to itself with no changes, resulting in a decompressed length of 6.
  it 'should decompress with no markers to itself' do
    day_nine = DayNinePartTwo.new('ADVENT')
    expect(day_nine.result_length).to eql(6)
  end

# A(1x5)BC repeats only the B a total of 5 times, becoming ABBBBBC for a decompressed length of 7.
  it 'should use markers' do
    day_nine = DayNinePartTwo.new('A(1x5)BC')
    expect(day_nine.result_length).to eql(7)
  end
# (3x3)XYZ becomes XYZXYZXYZ for a decompressed length of 9.
  it 'should duplicate a longer base string' do
    day_nine = DayNinePartTwo.new('(3x3)XYZ')
    expect(day_nine.result_length).to eq(9)
  end
# A(2x2)BCD(2x2)EFG doubles the BC and EF, becoming ABCBCDEFEFG for a decompressed length of 11.
  it 'with multiple markers' do
    day_nine = DayNinePartTwo.new('A(2x2)BCD(2x2)EFG')
    expect(day_nine.result_length).to eq(11)
  end

# X(8x2)(3x3)ABCY becomes X(3x3)ABC(3x3)ABCY (for a decompressed length of 18), because the decompressed data from the (8x2) marker (the (3x3)ABC) is skipped and not processed further.
  it 'with multiple markers next to each other' do
    day_nine = DayNinePartTwo.new('X(8x2)(3x3)ABCY')
    expect(day_nine.result_length).to eq(20)
  end

  it 'should create a large number of A' do
    day_nine = DayNinePartTwo.new('(27x12)(20x12)(13x14)(7x10)(1x12)A')
    expect(day_nine.result_length).to eq(241920)
  end

  it 'should expand number to a decent length' do
    day_nine = DayNinePartTwo.new('(25x3)(3x3)ABC(2x3)XY(5x2)PQRSTX(18x9)(3x2)TWO(5x7)SEVEN')
    expect(day_nine.result_length).to eq(445)
  end

  it 'with input from day 9' do
    day_nine = DayNinePartTwo.new(File.open('input.txt', 'r').read)
    expect(day_nine.result_length).to eq(10915059201)
  end

  it 'with input from day 9' do
    day_nine = DayNinePartTwo.new(File.open('input_catalina.txt', 'r').read)
    expect(day_nine.result_length).to eq(11107527530)
  end
end
