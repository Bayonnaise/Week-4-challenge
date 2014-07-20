require 'new_inject'

describe Array do
	let(:ary) { [1,2,3,4,5] }

	context 'iteration approach' do
		it 'sums a simple array using iteration' do
			expect(ary.iteration_inject(0)).to eq 15
		end

		it 'sums the same array with no starting value' do
			expect(ary.iteration_inject).to eq 15
		end

		it 'accepts a starting value as an argument' do
			expect(ary.iteration_inject(5)).to eq 20
		end
		
		it 'cannot accept three arguments' do
			expect { ary.iteration_inject(3,5,6) }.to raise_error
		end

		it 'raises error if arg2 is not a symbol' do
			expect { ary.iteration_inject(3,"z") }.to raise_error
		end

		it 'can can multiply as well' do
			expect(ary.iteration_inject(1, :*)).to eq 120
		end

		it 'can add strings' do
			str_ary = ["hello", "darkness", "my", "old", "friend"]
			expect(str_ary.iteration_inject).to eq "hellodarknessmyoldfriend"
		end
	end

	context 'recursion approach' do
		it 'accepts a starting value as an argument' do
			expect(ary.recursion_inject(5)).to eq 20
		end

		it 'sums a simple array using recursion' do
			expect(ary.recursion_inject(0)).to eq 15
		end

		it 'sums the same array with no starting value' do
			expect(ary.recursion_inject).to eq 15
		end
		
		it 'cannot accept three arguments' do
			expect { ary.recursion_inject(3,5,6) }.to raise_error
		end

		it 'raises error if arg2 is not a symbol' do
			expect { ary.recursion_inject(3,"z") }.to raise_error
		end

		it 'can can multiply as well' do
			expect(ary.recursion_inject(1, :*)).to eq 120
		end

		it 'can add strings' do
			str_ary = ["hello", "darkness", "my", "old", "friend"]
			expect(str_ary.recursion_inject).to eq "hellodarknessmyoldfriend"
		end
	end

end