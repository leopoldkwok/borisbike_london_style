class DockingStation

	

	def initialize(capacity = 20)
		@capacity ||= capacity
	end

	def bikes
		@bikes ||= []
	end

	def capacity
		@capacity
	end

	def capacity=(number)
		@capacity = number
	end

	def dock(bike)
		raise "full" if full?
		bikes << bike
	end

	def empty?
		bikes.empty?
	end

	def release(bike)
		bikes.delete(bike)
	end

	def full?
		bikes.count == capacity
	end

	def release_working_bikes
		working_bikes = bikes.select! {|bike| bike.broken? == false}

	end

	def release_broken_bikes
	 	broken_bikes = bikes.select! {|bike| bike.broken? == true}
	end


end