class CreateGeoTables < ActiveRecord::Migration
  def self.up
    create_table :city do |t|
      t.integer :county_id, :null => false
      t.integer :state_id, :null => false
      t.string :name, :null => false
      t.timestamps
    end
    create_table :county do |t|
      t.integer :state_id, :null => false
      t.string :name, :null => false
      t.timestamps
    end
    create_table :state do |t|
      t.string :name
      t.timestamps
    end
    create_table :postal_code do |t|
      t.integer :city_id, :null => false
      t.integer :county_id, :null => false
      t.integer :state_id, :null => false
      t.integer :code, :null => false
      t.decimal :latitude, :precision => 10, :scale => 8
      t.decimal :longitude, :precision => 10, :scale => 8
      t.timestamps
    end
    
    add_index :postal_code, :code, :unique => true
  end

  def self.down
    drop_table :city
    drop_table :county
    drop_table :state
    drop_table :postal_code
  end
end
