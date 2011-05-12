
city_models = {}
county_models = {}
state_models = {}

f = File.new(File.dirname(__FILE__) + '/../data/zipcodes_2006/zipcodes_2006.txt')
f.each do |line|
  fields = line.split(/\|\|/).collect! { |f| f.strip }
  next if fields.size != 6
  
  postal_code, latitude, longitude, state, city, county = fields
  city = city.titleize
  county = county.titleize
  
  state_model = state_models[state]
  if state_model.nil? 
    state_model = Geo::State.create(:name => state)
    state_models[state] = state_model
  end
  
  county_models_key = [county, state_model.id]
  county_model = county_models[county_models_key]
  if county_model.nil?
    county_model = Geo::County.create(:name => county, :state_id => state_model.id)
    county_models[county_models_key] = county_model
  end

  city_models_key = [city, county_model.id, state_model.id]
  city_model = city_models[city_models_key]
  if city_model.nil?
    city_model = Geo::City.create(:name => city, :county_id => county_model.id, :state_id => state_model.id)
    city_models[city_models_key]
  end

  Geo::PostalCode.create(:code => postal_code, :city_id => city_model.id, :county_id => county_model.id, :state_id => state_model.id, :latitude => latitude, :longitude => longitude)
end