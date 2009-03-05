class CreateListings < ActiveRecord::Migration
  def self.up
    create_table :listings do |t|
      t.integer :price
      t.string :yacht_name
      t.boolean :yacht_new
      t.string :yacht_location_city
      t.integer :yacht_location_state_id
      t.integer :yacht_location_country_id
      t.integer :yacht_specification_length
      t.string :yacht_specification_manufacturer
      t.string :yacht_specification_model
      t.integer :yacht_specification_year
      t.string :yacht_specification_designer

      t.timestamps
    end
  end

  def self.down
    drop_table :listings
  end
end
