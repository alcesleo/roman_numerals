require 'minitest/autorun'
require './roman_numerals'

describe RomanNumerals do

  let(:basic_map) { (1..10).zip(%w{ I II III IV V VI VII VIII IX X }) }

  describe '.to_roman' do
    it 'returns empty string on 0' do
      RomanNumerals.to_roman(0).must_equal ''
    end

    it 'handles the basic numbers' do
      basic_map.each do |arabic, roman|
        RomanNumerals.to_roman(arabic).must_equal roman
      end
    end

    it 'handles some big numbers' do
      RomanNumerals.to_roman(978).must_equal 'CMLXXVIII'
      RomanNumerals.to_roman(1000).must_equal 'M'
      RomanNumerals.to_roman(1001).must_equal 'MI'
    end
  end

end
