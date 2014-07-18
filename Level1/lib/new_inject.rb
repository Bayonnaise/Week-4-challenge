class Array
	def iterator_inject(sum = 0)
		self.each { |number| sum += number }
		sum
	end

	def recursion_inject(sum = 0)
		until self.count == 0
			sum += self.shift
			sum = self.recursion_inject(sum)
		end
		sum
	end
end