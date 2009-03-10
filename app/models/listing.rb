class Listing < ActiveRecord::Base
  has_many :details
  has_many :photos

  validates_numericality_of :price, :yacht_specification_length, :allow_nil=>true
  validates_inclusion_of :yacht_specification_year, :in => 1800..2100, :allow_nil=>true
end
