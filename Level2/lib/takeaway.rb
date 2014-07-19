require_relative 'dish'
require_relative 'menu'
require_relative 'messenger'
require 'twilio-ruby'

class Takeaway
	

	def initialize
		@order = []
		@menu = Menu.new
		@messenger = Messenger.new
		menu.add_dish(Dish.new(code: 11, name: "Chicken Jalfrezi", price: 7.49, type: :main))
		menu.add_dish(Dish.new(code: 12, name: "Lamb Balti", price: 8.49, type: :main))
		menu.add_dish(Dish.new(code: 13, name: "Vegetable Korma", price: 5.99, type: :main))
		menu.add_dish(Dish.new(code: 1, name: "Onion Bhaji", price: 1.29, type: :starter))
		menu.add_dish(Dish.new(code: 2, name: "Vegetable Pakora", price: 2.49, type: :starter))
		menu.add_dish(Dish.new(code: 31, name: "Mango Sorbet", price: 3.99, type: :dessert))
		menu.add_dish(Dish.new(code: 32, name: "Apple Crumble", price: 3.49, type: :dessert))
	end

	attr_reader :menu, :order, :messenger

	def run_all
		menu.display_menu
		done = false
		until done == "n" do
			order_dish
			puts "Order more? (y/n)"
			done = gets.chomp
		end
		print_order
	end

	def order_dish
		code = get_input("dish code").to_i
		quantity = get_input("quantity").to_i
		
		dish = menu.dishes.select { |dish| dish.code == code }
		
		add_to_order(dish[0], quantity)
	end

	def get_input(type)
		puts "Please enter a #{type}"
		gets.chomp
	end

	def add_to_order(dish, quantity)
		@order << {dish: dish, quantity: quantity}
	end

	def calculate_price
		sum = 0
		order.each do |line|
			sum += (line[:dish].price * line[:quantity])
		end
		sum
	end

	def print_order
		puts "Please confirm your order:"
		order.each do |line|
			puts "#{line[:quantity]} x #{line[:dish].name} £#{line[:dish].price}"
		end
		puts "ORDER TOTAL: £#{calculate_price}"
		confirm_order
	end

	def confirm_order
		puts "Do you want to place the order? (y/n)"
		if gets.chomp == "y"
			messenger.send_text_message
		else
			puts "Order cancelled"
			exit
		end
	end

end