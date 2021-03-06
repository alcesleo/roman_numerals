require './roman_numerals'

class Roman

  attr_reader :arabic, :roman

  def initialize(numeral)
    if numeral.is_a? Integer
      @arabic, @roman = numeral, RomanNumerals.to_roman(numeral)
    else
      @arabic, @roman = RomanNumerals.to_arabic(numeral.to_s), numeral
    end
  end

  def to_i
    arabic
  end

  def to_s
    roman
  end

  def inspect
    "#<Roman #{roman}>"
  end

  %i{ + - * / ** % }.each do |operator|
    define_method(operator) do |arg|
      Roman.new(self.arabic.public_send(operator, arg.arabic))
    end
  end

  def ==(other)
    self.arabic == other.arabic
  end

  def self.method_missing(method_name, *)
    if valid_roman_numeral?(method_name)
      new(method_name)
    else
      super
    end
  end

  def self.respond_to_missing?(method_name, include_private = false)
    valid_roman_numeral?(method_name)
  end

  private

  def self.valid_roman_numeral?(str)
    !!(str.to_s =~ /[MDCLXVI]+/)
  end

end
