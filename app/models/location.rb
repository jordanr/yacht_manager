class Location < ActiveRecord::Base
  include YachtManagerHelper
  has_many :yachts
  
  validates_state
  validates_country

end
