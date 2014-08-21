require 'bike'

describe 'Bike' do

	let(:bike) { Bike.new }


	it 'can be broken' do
		bike.break!
		expect(bike).to be_broken
	end

	it 'can be fixed' do
		bike.fix!
		expect(bike).to_not be_broken
	end

	it 'is not broken when created' do
		expect(bike).to_not be_broken
	end

end
