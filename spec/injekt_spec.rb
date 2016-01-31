require 'injekt'

describe Array do

  let(:array) {[1, 2, 3, 4, 5]}

  it '.injekt produces the same result as .inject' do
    expect(array.injekt(array) {|memo, i| memo - i}).to eq array.inject(:-)
  end

end
