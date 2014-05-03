class Roman

  FACTORS = {
    1000 => "M",
    900 => "CM",
    500 => "D",
    400 => "CD",
    100 => "C",
    90 => "XC",
    50 => "L",
    40 => "XL",
    10 => "X",
    9 => "IX",
    5 => "V",
    4 => "IV",
    1 => "I",
  }


  def initialize(number)
    @number = number
  end

  def to_s
    to_roman @number
  end

  private

  def to_roman(number)
    FACTORS.keys.reduce("") do |roman, div|
      times, number = number.divmod(div)
      roman << FACTORS[div] * times
    end
  end


end
