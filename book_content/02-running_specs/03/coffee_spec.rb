class Coffee
  def ingredients
    @ingredients ||= []
  end

  def add(ingredient)
    ingredients << ingredient
  end

  def price
    1.00 + ingredients.length * 0.25
  end
end

RSpec.describe 'A cup of coffee' do
  let(:coffee) { Coffee.new }

  it 'coust $1' do
    expect(coffee.price).to eq(1.00)
  end

  context 'with milk' do
    it 'cost $1.25' do
      expect(coffee.price).to eq(1.25)
    end
  end
end