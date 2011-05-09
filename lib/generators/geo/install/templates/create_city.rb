class ListingActiveColumn < ActiveRecord::Migration
  def self.up
    add_column :listing, :active, :boolean, :default => true, :after => :dealership_id
  end

  def self.down
    remove_column :listing, :active
  end
end
