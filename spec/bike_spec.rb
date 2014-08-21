require 'bike'

describe 'Bike' do


	it 'can be broken' do
		bike = Bike.new
		bike.break!
		expect(bike).to be_broken
	end

	it 'can be fixed' do
		bike = Bike.new
		bike.fix!
		expect(bike).to_not be_broken
	end

	it 'is not broken when created' do
		bike = Bike.new
		expect(bike).to_not be_broken
	end

end
