class Specification < ActiveRecord::Base
  belongs_to :specification_class
  belongs_to :picture
end
