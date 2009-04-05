class AddFieldsToListing < ActiveRecord::Migration
  def self.up
    add_column :listings, :yacht_specification_material, :string
    add_column :listings, :yacht_specification_fuel, :string
    add_column :listings, :yacht_specification_number_of_engines, :integer
  end

  def self.down
    remove_column :listings, :yacht_specification_number_of_engines
    remove_column :listings, :yacht_specification_fuel
    remove_column :listings, :yacht_specification_material
  end
end
