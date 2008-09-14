class Price < ActiveRecord::Base
  belongs_to :listing

  def to_s
    value # + currency
  end

end
