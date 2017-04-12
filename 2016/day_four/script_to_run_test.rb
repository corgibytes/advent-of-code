require 'pry-byebug'
class RoomDecoder
  def self.sector_id(name)
    name.split('[')

    regular_expression = /(.+)-(\d+)\[(\w+)\]/
    match_data = name.match(regular_expression)

    encrypted_name = match_data[1]
    sector_id = match_data[2]
    checksum = match_data[3]

    if computed_checksum(encrypted_name) == checksum
      sector_id.to_i
    else
      0
    end
  end

  def self.computed_checksum(name)
    # Count occurences of letters in name
    # Then sort them
    character_array = name.gsub('-', '').chars
    some_hash = {}
    character_array.each do |ch|
      some_hash[ch] = some_hash[ch].to_i + 1
    end
    sorted_hash = Hash[some_hash.sort { |a, b| b[1] <=> a[1] }]
    another_hash = {}
    sorted_hash.each do |key, value|
      if another_hash[value].nil?
        another_hash[value] = [key]
      else
        another_hash[value] << key
      end
    end
    another_hash.map do |key, value|
      value.sort!
    end
    another_hash.values.join('')[0..4]
  end
end

## room-name[checksum]
#  Checksum letters should be most popular in room-name
#  Need Room Name, Sector ID (number), and Checksum
#
#  Result Should be the sum of all valid Sector IDs
#  123 + 987 + 404 = 1514
#
describe RoomDecoder do
  describe 'computed_checksum' do
    it 'should return a' do
      expect(RoomDecoder.computed_checksum('a')).to eq('a')
    end
    it 'abcde' do
      expect(RoomDecoder.computed_checksum('abcde')).to eq('abcde')
    end
    it 'ab-cd' do
      expect(RoomDecoder.computed_checksum('ab-cd')).to eq('abcd')
    end
    it 'ab-cda' do
      expect(RoomDecoder.computed_checksum('ab-cda')).to eq('abcd')
    end
    it 'ab-cdd' do
      expect(RoomDecoder.computed_checksum('ab-cdd')).to eq('dabc')
    end
    it 'aaaaa-bbb-z-y-x' do
      expect(RoomDecoder.computed_checksum('aaaaa-bbb-z-y-x')).to eq('abxyz')
    end
  end

  describe 'sector_id' do
    it 'aaaaa-bbb-z-y-x-123[abxyz] is a real room because the most common letters are a (5), b (3), and then a tie between x, y, and z, which are listed alphabetically.' do
      allow(RoomDecoder).to receive(:computed_checksum) { 'abxyz' }
      name = "aaaaa-bbb-z-y-x-123[abxyz]"
      expect(RoomDecoder.sector_id(name)).to eq(123)
    end

    it 'a-b-c-d-e-f-g-h-987[abcde] is a real room because although the letters are all tied (1 of each), the first five are listed alphabetically.' do
      name = "a-b-c-d-e-f-g-h-987[abcde]"
      expect(RoomDecoder.sector_id(name)).to eq(987)
    end

    it 'not-a-real-room-404[oarel] is a real room.' do
      name = "not-a-real-room-404[oarel]"
      expect(RoomDecoder.sector_id(name)).to eq(404)
    end

    it 'totally-real-room-200[decoy] is not.' do
      name = "totally-real-room-200[decoy]"
      expect(RoomDecoder.sector_id(name)).to eq(0)
    end

    it 'mob-programming-rocks-500[welmn]' do
      name = "mob-programming-rocks-500[welmn]"
      expect(RoomDecoder.sector_id(name)).to eq(0)
    end
  end
end
