require 'takeaway'

describe Takeaway do
	let(:takeaway) { Takeaway.new }
	before(:each) { allow(takeaway).to receive(:puts) }

	it 'initialises with dishes in the menu' do
		expect(takeaway.menu.dishes.count).to eq 7
	end

	it 'asks the user for a dish' do
		expect(takeaway).to receive(:gets).and_return("11", "2")
		expect(takeaway.order).not_to be nil
		takeaway.order_dish
	end

	it 'calculates the order total' do
		dish1 = Dish.new(code: 11, name: "Chicken Jalfrezi", price: 7.50, type: :main)
		dish2 = Dish.new(code: 31, name: "Mango Sorbet", price: 3.15, type: :dessert)
		takeaway.add_to_order(dish1, 2)
		takeaway.add_to_order(dish2, 3)
		expect(takeaway.calculate_price).to eq 24.45
	end

	it 'confirms the order' do
		allow(takeaway).to receive(:gets).and_return("y")
		messenger = double :messenger, send_text_message: nil
		expect(takeaway.messenger).to receive(:send_text_message)
		takeaway.confirm_order
	end

end