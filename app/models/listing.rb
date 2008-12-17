class Listing < ActiveRecord::Base
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

  def to_yt
    YachtTransfer::Models::Listing.new({:yacht=>yacht.to_yt, :price=>current_price.to_yt, :broker=>"Dad",
                                        :type=>(central?) ? "central" : "open", :status=>status, :co_op=>true,
                                        :contact_info=>"sample_contact_info"})
  end



end
