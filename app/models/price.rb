class Price < ActiveRecord::Base
  include YachtManagerHelper
  belongs_to :listing

  validates_currency

  def to_s
    value # + currency
  end

end
