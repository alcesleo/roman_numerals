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
    FACTORS.to_a.reduce("") do |roman, (arabic_factor, roman_factor)|
      times, arabic = arabic.divmod(arabic_factor)
      roman << roman_factor * times
    end
  end

end
