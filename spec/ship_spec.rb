require_relative '../lib/ship'

describe Ship do
	
	it 'has a size' do
		expect(subject.size).to eq Ship::DEFAULT_SIZE
	end

	it 'increases hit counter when hit' do 
		subject.get_hit
		expect(subject.hit_counter).to eq 1
	end

	it 'is sunk when hit as many times as the size' do
		subject.size.times {subject.get_hit}
		expect(subject).to be_sunk
	end

end