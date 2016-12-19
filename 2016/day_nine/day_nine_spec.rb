require 'rspec'
require_relative 'day_nine'

describe DayNine do
  # ADVENT contains no markers and decompresses to itself with no changes, resulting in a decompressed length of 6.
  it 'should decompress with no markers to itself' do
    day_nine = DayNine.new('ADVENT')
    expect(day_nine.result_length).to eql(6)
  end

# A(1x5)BC repeats only the B a total of 5 times, becoming ABBBBBC for a decompressed length of 7.
  it 'should use markers' do
    day_nine = DayNine.new('A(1x5)BC')
    expect(day_nine.result_length).to eql(7)
  end
# (3x3)XYZ becomes XYZXYZXYZ for a decompressed length of 9.
  it 'should duplicate a longer base string' do
    day_nine = DayNine.new('(3x3)XYZ')
    expect(day_nine.result_length).to eq(9)
  end
# A(2x2)BCD(2x2)EFG doubles the BC and EF, becoming ABCBCDEFEFG for a decompressed length of 11.
  it 'with multiple markers' do
    day_nine = DayNine.new('A(2x2)BCD(2x2)EFG')
    expect(day_nine.result_length).to eq(11)
  end

# (6x1)(1x3)A simply becomes (1x3)A - the (1x3) looks like a marker, but because it's within a data section of another marker, it is not treated any differently from the A that comes after it. It has a decompressed length of 6.
# X(8x2)(3x3)ABCY becomes X(3x3)ABC(3x3)ABCY (for a decompressed length of 18), because the decompressed data from the (8x2) marker (the (3x3)ABC) is skipped and not processed further.
end
