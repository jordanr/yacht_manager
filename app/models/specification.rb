class Specification < ActiveRecord::Base
#  include YachtTransfer::Rails::Model
  has_many :yachts

  STANDARD_SPECIFICATION = 1

  validates_yacht_type
  validates_hull_material
  validates_length_units
  validates_weight_units
  validates_volume_units
  validates_speed_units
  validates_fuel

  validates_numericality_of :length, :lwl, :loa, :beam, :min_draft, :max_draft, :bridge_clearance, :displacement, :ballast, :cruise_speed, :max_speed, :fuel_tank_capacity, :water_tank_capacity, :holding_tank_capacity, :engine_horsepower, :allow_nil=>true
  validates_numericality_of :number_of_engines, :only_integer => true
  validates_numericality_of :engine_hours, :only_integer => true, :allow_nil=>true
  validates_inclusion_of :year, :in=> 1000..(Time.now.year+1)
  validates_inclusion_of :engine_year, :in=> 1000..(Time.now.year+1), :allow_nil=>true
  validates_presence_of :manufacturer, :length

  def to_s
    "#{length.to_i} #{length_units} #{manufacturer}"
  end

  def self.standards
    a = find_by_specification_class_id(STANDARD_SPECIFICATION) || []
    [a].flatten
  end
end
