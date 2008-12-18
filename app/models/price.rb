class Price < ActiveRecord::Base
  belongs_to :listing

  validates_currency
  validates_numericality_of :value
  def to_s
    "#{value.to_i} #{currency}"
  end

  def to_yt
    {:value=>value.to_i, :units=>currency}.delete_bad_values   
  end

end
