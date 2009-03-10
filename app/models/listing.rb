class Listing < ActiveRecord::Base
  has_many :details
  has_many :photos

  validates_numericality_of :price, :yacht_specification_length
  validates_inclusion_of :yacht_specification_year, :in => 1800..2100
end
