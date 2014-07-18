require 'new_inject'

describe Array do

	it 'sums an array using iteration' do
		ary = [1,2,3,4,5]
		expect(ary.iteration_inject).to eq 15
	end

	it 'sums an array using recursion' do
		ary = [1,2,3,4,5]
		expect(ary.recursion_inject).to eq 15
	end

end