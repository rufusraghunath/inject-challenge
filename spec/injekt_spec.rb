require 'injekt'

describe Array do

  let(:array) {[1, 2, 3, 4, 5]}

  context 'simple math' do

    it 'addition' do
      expect(array.injekt(array) {|memo, i| memo + i}).to eq array.inject(:+)
    end

    it 'subtraction' do
      expect(array.injekt(array) {|memo, i| memo - i}).to eq array.inject(:-)
    end

    it 'multiplication' do
      expect(array.injekt(array) {|memo, i| memo * i}).to eq array.inject(:*)
    end

    it 'division' do
      expect(array.injekt(array) {|memo, i| memo/i}).to eq array.inject(:/)
    end

  end

  context 'complex operations' do

    it 'handles more complex operations' do
      expect(array.injekt(array) {|memo, i| ((memo + 50)-(i^32))}).to eq array.inject {|memo, i| ((memo + 50)-(i^32))}
    end

  end

end
