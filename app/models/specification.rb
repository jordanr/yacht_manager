class Specification < ActiveRecord::Base
  has_many :yachts
  belongs_to :specification_class
  belongs_to :picture
end
