class Listing < ActiveRecord::Base
  include YachtManagerHelper
  has_many :uploads, :dependent=>:destroy
  has_many :prices, :dependent=>:destroy

  belongs_to :yacht, :dependent=>:destroy
  belongs_to :user


  validates_status

  def current_price
    prices.first # wrong (use created/updated at)
  end

  def to_s
    yacht.to_s 
  end

end
