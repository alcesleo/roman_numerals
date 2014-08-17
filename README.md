# Roman numerals converter

Object oriented roman numerals converter that with some simple magic supports
things like this: `Roman.X + Roman.VI == Roman.XVI`


## More examples

```ruby
# Using the converter directly
require './roman_numerals'

RomanNumerals.to_roman(978)          # => "CMLXXVIII"
RomanNumerals.to_arabic('CMLXXVIII') # => 978
RomanNumerals.to_arabic('VXI')       # ~> ArgumentError: Invalid roman numeral

# Using the class
require './roman'

# Instanciate with integers or strings
Roman.new(16)    # => #<Roman XVI>
Roman.new('XVI') # => #<Roman XVI>

# Equality
Roman.new(16) == Roman.new('XVI') # => true

# Conversions
sixteen = Roman.new(16)
sixteen.to_i # => 16
sixteen.to_s # => "XVI"

# Magic numerals!
Roman.XVI # => #<Roman XVI>

# Maths!
Roman.XVI + Roman.VI         # => #<Roman XXII>
Roman.MCLX - Roman.XXIV      # => #<Roman MCXXXVI>
Roman.L / Roman.X == Roman.V # => true
```
