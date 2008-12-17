class Location < ActiveRecord::Base
#  include YachtTransfer::Rails::Model
  has_many :yachts
  
  validates_state
  validates_country

  def to_yt
    {:city=>city, :zip=>33315, :country=>country,
     :state=>state, :region=>"sample region"
    }
  end
end
