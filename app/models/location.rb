class Location < ActiveRecord::Base
#  include YachtTransfer::Rails::Model
  has_many :yachts
  
  validates_state
  validates_country

end
