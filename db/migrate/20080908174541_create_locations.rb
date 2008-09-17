class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.string :city
      t.integer :state_id, :default=> 10 # florida
      t.integer :country_id, :default=> 232 # USA

      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
