module Geo
  class PostalCode < ActiveRecord::Base
    belongs_to :city
    belongs_to :county
    belongs_to :state
  end
end