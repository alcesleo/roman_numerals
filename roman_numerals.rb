module RomanNumerals

  FACTORS = {
    1000 => "M",
    900  => "CM",
    500  => "D",
    400  => "CD",
    100  => "C",
    90   => "XC",
    50   => "L",
    40   => "XL",
    10   => "X",
    9    => "IX",
    5    => "V",
    4    => "IV",
    1    => "I",
  }

  def self.to_roman(arabic)
    unless arabic.integer? and arabic >= 1
      raise ArgumentError.new('Roman numerals can only represent positive integers')
    end

    FACTORS.to_a.reduce("") do |roman, (arabic_factor, roman_factor)|
      times, arabic = arabic.divmod(arabic_factor)
      roman << roman_factor * times
    end
  end

  def self.to_arabic(roman)
    roman = roman.upcase

    result = FACTORS.to_a.reduce(0) do |arabic, (arabic_factor, roman_factor)|
      while roman.start_with?(roman_factor)
        roman.slice!(0, roman_factor.length)
        arabic += arabic_factor
      end
      arabic
    end

    raise ArgumentError.new('Invalid roman numeral') unless roman.empty?
    result
  end

end
