class CreateSpecifications < ActiveRecord::Migration
  def self.up
    create_table :specifications do |t|
      t.integer :picture_id
      t.integer :specification_class_id
      t.string :description
      t.string :manufacturer
      t.string :model
      t.integer :year
      t.integer :type_id
      t.decimal :length
      t.decimal :lwl
      t.decimal :loa
      t.decimal :beam
      t.decimal :min_draft
      t.decimal :max_draft
      t.decimal :bridge_clearance
      t.decimal :displacement
      t.decimal :ballast
      t.decimal :cruise_speed
      t.decimal :max_speed
      t.integer :length_units_id
      t.integer :weight_units_id
      t.integer :speed_units_id
      t.integer :volume_units_id
      t.integer :hull_material_id
      t.string :designer
      t.decimal :fuel_tank_capacity
      t.decimal :water_tank_capacity
      t.decimal :holding_tank_capacity
      t.string :engine_manufacturer
      t.string :engine_model
      t.integer :engine_fuel_id
      t.decimal :engine_horsepower
      t.integer :engine_year
      t.integer :engine_hours
      t.integer :number_of_engines

      t.timestamps
    end
  end

  def self.down
    drop_table :specifications
  end
end
