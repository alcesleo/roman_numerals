require './roman_numerals'

class Roman

  attr_reader :arabic, :roman

  def initialize(numeral)
    if numeral.is_a? String
      @arabic = RomanNumerals.to_arabic(numeral)
      @roman  = numeral
    elsif numeral.is_a? Integer
      @arabic = numeral
      @roman  = RomanNumerals.to_roman(numeral)
    end
  end

  def ==(other)
    self.arabic == other.arabic
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

  def self.method_missing(method_name, *args, &block)
    if matches_roman_regex(method_name)
      new(method_name.to_s)
    else
      super
    end
  end

  def self.respond_to_missing?(method_name, include_private = false)
    matches_roman_regex(method_name)
  end

  private

  def self.matches_roman_regex(str)
    /[MDCLXVI]+/ === str.to_s
  end

end
