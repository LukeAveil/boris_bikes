require_relative 'bike'

class DockingStation

	attr_reader :capacity

	DEFAULT_CAPACITY = 20

	def initialize(capacity=DEFAULT_CAPACITY)
		@bikes = []
		@capacity = capacity
	end

	def release_bike
		fail "There are no bikes" if empty?
		fail "The bike is broken" if bikes.last.working? == false
		bikes.pop
	end

	def dock (bike)
		fail "This station is full" if full?
		bikes << bike
		bike
	end

	private

	attr_reader :bikes

	def full?
		bikes.length >= @capacity
	end

	def empty?
		bikes.empty?
	end

end
