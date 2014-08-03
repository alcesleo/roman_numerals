require 'minitest/autorun'
require './roman'

describe Roman do

  subject { Roman.new(16) }

  it 'has nice inspection output' do
    subject.inspect.must_equal '#<Roman XVI>'
  end

  it 'responds with roman numeral as string' do
    subject.to_s.must_equal "XVI"
  end

  it 'can be instanciated with strings' do
    Roman.new("XVI").to_i.must_equal 16
  end

  it 'supports equality' do
    subject.must_equal Roman.new(16)
  end

  it 'instanciates objects with method_missing' do
    Roman.XVI.to_i.must_equal 16
  end

  it 'responds to roman numerals' do
    Roman.respond_to?(:XVI).must_equal true
  end

  it 'does not respond to unrelated missing methods' do
    Roman.respond_to?(:unrelated).must_equal false
  end

  it 'ducktypes inputs as strings containing numerals' do
    Roman.new(Roman.new(16)).must_equal subject
  end

  it 'fails on invalid type' do
    -> { Roman.new(1.6) }.must_raise ArgumentError
  end

  it 'fails on invalid roman numeral' do
    -> { Roman.new('VIX') }.must_raise ArgumentError
  end

  it 'handles maths' do
    (Roman.XVI - Roman.X).must_equal Roman.VI
    (Roman.V * Roman.III).must_equal Roman.XV
  end
end
