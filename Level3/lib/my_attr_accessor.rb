class Class
	def my_attr_accessor(*args)
		args.each do |arg|
			self.class_eval("def #{arg}; @#{arg}; end")
			self.class_eval("def #{arg}=(val); @#{arg} = val; end")
		end
	end
end

class Person
	def initialize(name, age)
		@name = name
		@age = age
	end

	my_attr_accessor :name, :age

end