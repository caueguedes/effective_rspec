RSpec.describe 'An ideal sandwich' do
  Sandwich = Struct.new(:taste, :toppings)

  it 'is delicious' do
    sandwich = Sandwich.new('delicious', [])
    taste = sandwich.taste

    expect(taste).to eq('delicious')
  end
end