require 'dish'

describe Dish do
	
	let(:dish) { Dish.new(code: 1, name: "Chicken Jalfrezi", price: 7.49, type: :main) }

	it 'has a name' do
		expect(dish.name).to eq "Chicken Jalfrezi"
	end

	it 'has a default price of £1' do
		expect(dish.price).to eq 7.49
	end

	it 'formats a price for output' do
		expect(dish.show_price).to eq "£7.49"
	end

	it 'formats a single dish for output' do
		expect(dish.display_dish).to eq "1: Chicken Jalfrezi - £7.49"
	end

end