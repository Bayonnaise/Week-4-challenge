require 'menu'

describe Menu do
	let(:menu) { Menu.new }
	let(:dish1) { Dish.new(code: 1, name: "Chicken Jalfrezi", price: 7.49, type: :main) }
	let(:dish2) { Dish.new(code: 2, name: "Prawn Crackers", price: 1.99, type: :starter) }
	let(:dish3) { Dish.new(code: 3, name: "Punki", price: 3.49, type: :dessert)}

	it 'can add a dish' do
		menu.add_dish(dish1)
		expect(menu.dishes).to eq [dish1]
	end

	context 'when displaying the menu' do
		before(:each) {
			menu.add_dish(dish1)
			menu.add_dish(dish2)
			menu.add_dish(dish3)
		}

		it 'can break menu into sections' do
			expect(menu.sub_header(dish1.type)).to eq "----------MAINS----------"
		end

		it 'can get all of a type' do
			expect(menu.get_dishes(:starter)).to eq [dish2]
		end

		it 'can display all of a type' do
			expect(menu).to receive(:puts).with("2: Prawn Crackers - £1.99")
			menu.display_dishes(:starter)
		end
	end
end