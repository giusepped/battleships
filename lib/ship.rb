class Ship

	attr_reader :size, :hit_counter

	DEFAULT_SIZE = 1

	def initialize(size=DEFAULT_SIZE)
		@size = size
		@hit_counter = 0
	end

	def get_hit
		@hit_counter += 1
	end

	def sunk?
		true if hit_counter == size
	end

end