class Menu
	def initialize
		@dishes = []
		@sections = [:starter, :main, :dessert]
	end

	attr_reader :dishes, :sections

	def add_dish(dish)
		@dishes << dish
	end

	def get_dishes(section)
		dishes.select { |dish| dish.type == section }
	end

	def sub_header(section)
		"#{section.to_s.upcase}S".center(25, "-")
	end

	def display_dishes(section)
		get_dishes(section).each do |dish|
			puts dish.display_dish
		end
	end

	def display_menu
		puts "MENU".center(25, "-")
		sections.each do |section|
			puts sub_header(section)
			display_dishes(section)
		end
	end

end