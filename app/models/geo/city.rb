module Geo
  class City < ActiveRecord::Base
    belongs_to :county
    belongs_to :state
    has_many :postal_codes
    
  end
end