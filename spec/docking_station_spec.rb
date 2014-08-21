require 'docking_station'

describe 'docking_station' do

	let(:bike) 				{ double :bike, broken?: false }			  
	let(:broken_bike)		{ double :bike, broken?: true  }
	let(:station)			{ DockingStation.new		   }


	it 'has no bikes' do
		expect(station).to be_empty
		# expect(station.bikes).to eq []
		# expect(station.bikes.count).to eq 0
	end

	it 'can dock a bike' do
		bike = double (:bike)
		station.dock(bike)
		expect(station).not_to be_empty
	end

	it 'has that bike after docking it' do
		bike = double (:bike)
		station.dock(bike)
		expect(station.bikes).to include(bike)
	end

	it 'can release a bike' do
		station.dock(bike)
		station.release(bike)
		expect(station).to be_empty 
	end

	it 'should have a default capacity' do
		expect(station.capacity).to eq 20
	end

	it 'should have a custom capacity' do
		station = DockingStation.new(50)
		expect(station.capacity).to eq 50
	end

	it 'should know when it is full' do
		expect(station).to be_empty
		20.times {station.dock(bike)}
		expect(station).to be_full
	end

	it 'should not dock a bike when full' do
		expect(station).to be_empty
		station.capacity.times {station.dock(bike)}
		expect(station).to be_full
		expect{(station.dock(bike))}.to raise_error(RuntimeError)
	end	
	
	it 'has a broken bike' do
		station.dock(broken_bike)
		expect(station.bikes).to eq [broken_bike]
	end

	it 'should only have working bikes available' do
		station.dock(broken_bike)
		station.dock(bike)
		expect(station.release_working_bikes).to eq [bike]
	end

	it 'should only have broken bikes available' do
		station.dock(broken_bike)
		station.dock(bike)
		expect(station.release_broken_bikes).to eq [broken_bike]
	end



end