require_relative 'triangle'

describe Triangle do
  context '.from_string' do
    it 'can create with three sides' do
      sides = "5  10  25"
      triangle = Triangle.from_string(sides)
      expect(triangle.sides).to eq([5, 10, 25])
    end

    it 'has a factory method' do
      sides = "5  10  25"
      triangle = Triangle.from_string(sides)
      expect(triangle).to_not be_nil
    end
  end

  context '#is_valid?' do
    context 'for an invalid sides' do
      it 'should be invalid' do
        sides = "5 10 25"
        triangle = Triangle.from_string(sides)
        expect(triangle.is_valid?).to be_falsey
      end
    end

    context 'for a valid sides' do
      it 'should be valid' do
        sides = "2 3 4"
        triangle = Triangle.from_string(sides)
        expect(triangle.is_valid?).to be_truthy
      end
    end
  end
end
