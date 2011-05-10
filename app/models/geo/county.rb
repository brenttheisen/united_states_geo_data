module Geo
  class County < ActiveRecord::Base
    belongs_to :state
    has_many :cities
    has_many :postal_codes
  end
end