module Geo
  class State < ActiveRecord::Base
    has_many :cities
    has_many :counties
    has_many :postal_codes
  end
end