namespace :geo do 
	desc 'Load records in to the city, county, state and postal code models.'
	task :load_seed => :environment do
		Geo::Engine.new.load_seed
	end
	
end
