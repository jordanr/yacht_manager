class Listing < ActiveRecord::Base
  has_many :details
  has_many :photos
end
