class Price < ActiveRecord::Base
#  include YachtTransfer::Rails::Model
  belongs_to :listing

  validates_currency
  validates_numericality_of :value
  def to_s
    "#{value.to_i} #{currency}"
  end

end
