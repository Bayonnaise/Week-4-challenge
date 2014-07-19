class Dish
	def initialize(code: code, name: name, price: price, type: type)
		@code = code
		@name = name
		@price = price
		@type = type
	end

	attr_reader :name, :price, :type, :code

	def show_price
		price_2dp = "%.2f" % price
		"£#{price_2dp}"
	end

	def display_dish
		"#{code}: #{name} - #{show_price}"
	end
end