class Array

	def iteration_inject(*args)
		if args.size > 2
			raise ArgumentError
		elsif args.size < 2
			total = args[0] || self.shift
			sym = :+
		else
			raise ArgumentError if !args[1].is_a? Symbol
			total, sym = args[0], args[1]
		end

		self.each { |item| total = total.send(sym, item) }
		total
	end

	def recursion_inject(*args)
		if args.size > 2
			raise ArgumentError
		elsif args.size < 2
			total = args[0] || self.shift
			sym = :+
		else args.size == 2
			raise ArgumentError if !args[1].is_a? Symbol
			total, sym = args[0], args[1]
		end

		return total if self.size == 0
		total = total.send(sym, self.shift)
		self.recursion_inject(total, sym)
	end
end