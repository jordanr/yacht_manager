class Specification < ActiveRecord::Base
  include YachtManagerHelper
  has_many :yachts
  belongs_to :specification_class
  belongs_to :picture

  validates_yacht_type
  validates_hull_material
  validates_length_units
  validates_weight_units
  validates_volume_units
  validates_speed_units
  validates_fuel

end
