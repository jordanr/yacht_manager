class Listing < ActiveRecord::Base
  has_many :uploads
  has_many :prices

  belongs_to :yacht
  belongs_to :user
end
