require 'minitest/autorun'
require './roman'

describe Roman do

  let(:basic_map) { (1..10).zip(%w{ I II III IV V VI VII VIII IX X }) }

  it 'returns empty string on 0' do
    Roman.new(0).to_s.must_equal ''
  end

  it 'handles the basic numbers' do
    basic_map.each do |arabic, roman|
      Roman.new(arabic).to_s.must_equal roman
    end
  end

  it 'handles some big numbers' do
    Roman.new(978).to_s.must_equal 'CMLXXVIII'
    Roman.new(1000).to_s.must_equal 'M'
    Roman.new(1001).to_s.must_equal 'MI'
  end

end
