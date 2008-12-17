class Accommodation < ActiveRecord::Base
  belongs_to :yacht

  def <=>(o)
    order <=> o.order
  end

  def to_yt
    {:title=>title,:content=>content, :left=>left, :right=>right}
  end
end
