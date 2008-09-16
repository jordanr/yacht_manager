class Yacht < ActiveRecord::Base
  has_many :listings
  has_many :accommodations, :dependent=>:destroy
  has_many :pictures, :dependent=>:destroy
  belongs_to :specification, :dependent=>:destroy
  belongs_to :location, :dependent=>:destroy

  def to_s
    "#{specification.length} #{specification.manufacturer}"
  end
end
