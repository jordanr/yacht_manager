class Accommodation < ActiveRecord::Base
  belongs_to :yacht

  def <=>(o)
    order <=> o.order
  end
end
