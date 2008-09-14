class Listing < ActiveRecord::Base
  include YachtManagerHelper
  has_many :uploads
  has_many :prices

  belongs_to :yacht
  belongs_to :user


  validates_status

  def current_price
    prices.first # wrong (use created/updated at)
  end

  def to_s
    yacht.to_s 
  end

end
