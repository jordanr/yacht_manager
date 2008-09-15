class Price < ActiveRecord::Base
  include YachtManagerHelper
  belongs_to :listing

  validates_currency
  validates_numericality_of :value
  def to_s
    value # + currency
  end

end
