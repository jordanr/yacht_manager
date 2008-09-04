class AddFieldsToListing < ActiveRecord::Migration
  def self.up
    add_column :listings, :is_central, :boolean
    add_column :listings, :status, :integer
    add_column :listings, :yacht_name, :string
    add_column :listings, :yacht_manufacturer, :string
    add_column :listings, :yacht_model, :string
    add_column :listings, :is_new, :boolean
    add_column :listings, :yacht_description, :string
    add_column :listings, :yacht_year, :integer
    add_column :listings, :yacht_type, :integer
    add_column :listings, :length, :integer
    add_column :listings, :lwl, :integer
    add_column :listings, :loa, :integer
    add_column :listings, :beam, :integer
    add_column :listings, :min_draft, :integer
    add_column :listings, :max_draft, :integer
    add_column :listings, :bridge_clearance, :integer
    add_column :listings, :displacement, :integer
    add_column :listings, :ballast, :integer
    add_column :listings, :cruise_speed, :integer
    add_column :listings, :max_speed, :integer
    add_column :listings, :length_units, :integer
    add_column :listings, :weight_units, :integer
    add_column :listings, :speed_units, :integer
    add_column :listings, :price, :integer
    add_column :listings, :currency, :integer
    add_column :listings, :city, :string
    add_column :listings, :state, :integer
    add_column :listings, :country, :integer
    add_column :listings, :hull_material, :integer
    add_column :listings, :designer, :string
    add_column :listings, :fuel_tank_capacity, :integer
    add_column :listings, :water_tank_capacity, :integer
    add_column :listings, :holding_tank_capacity, :integer
    add_column :listings, :volume_units, :integer
    add_column :listings, :engine_manufacturer, :string
    add_column :listings, :engine_model, :string
    add_column :listings, :engine_fuel, :integer
    add_column :listings, :engine_horsepower, :integer
    add_column :listings, :engine_year, :integer
    add_column :listings, :engine_hours, :integer
    add_column :listings, :number_of_engines, :integer
  end

  def self.down
    remove_column :listings, :number_of_engines
    remove_column :listings, :engine_hours
    remove_column :listings, :engine_year
    remove_column :listings, :engine_horsepower
    remove_column :listings, :engine_fuel
    remove_column :listings, :engine_model
    remove_column :listings, :engine_manufacturer
    remove_column :listings, :volume_units
    remove_column :listings, :holding_tank_capacity
    remove_column :listings, :water_tank_capacity
    remove_column :listings, :fuel_tank_capacity
    remove_column :listings, :hull_designer
    remove_column :listings, :hull_material
    remove_column :listings, :country
    remove_column :listings, :state
    remove_column :listings, :city
    remove_column :listings, :currency
    remove_column :listings, :price
    remove_column :listings, :speed_units
    remove_column :listings, :weight_units
    remove_column :listings, :length_units
    remove_column :listings, :max_speed
    remove_column :listings, :cruise_speed
    remove_column :listings, :ballast
    remove_column :listings, :displacement
    remove_column :listings, :bridge_clearance
    remove_column :listings, :max_draft
    remove_column :listings, :min_draft
    remove_column :listings, :beam
    remove_column :listings, :loa
    remove_column :listings, :lwl
    remove_column :listings, :length
    remove_column :listings, :yacht_type
    remove_column :listings, :yacht_year
    remove_column :listings, :yacht_description
    remove_column :listings, :is_new
    remove_column :listings, :yacht_model
    remove_column :listings, :yacht_manufacturer
    remove_column :listings, :yacht_name
    remove_column :listings, :status
    remove_column :listings, :is_central
  end
end
