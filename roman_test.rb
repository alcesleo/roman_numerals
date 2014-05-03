require 'minitest/autorun'
require './roman'

describe Roman do
  it 'handles the basic numbers' do
    romans = %w{ I II III IV V VI VII VIII IX X }
    romans.each_with_index do |roman, integer|
      Roman.new(integer + 1).to_s.must_equal roman
    end
  end

  it 'handles some big numbers' do
    Roman.new(978).to_s.must_equal 'CMLXXVIII'
    Roman.new(1000).to_s.must_equal 'M'
    Roman.new(1001).to_s.must_equal 'MI'
  end
end
