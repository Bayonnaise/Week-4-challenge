class Class

	def my_attr_accessor(*args)
		args.each do |arg|
			self.class_eval("def #{arg}; @#{arg} = #{arg}; end")
			self.class_eval("def #{arg}=(val); @#{arg} = val; end")
		end
	end


end