class Yacht < ActiveRecord::Base
  has_many :listings
  has_many :accommodations
  has_many :pictures
  belongs_to :specification
  belongs_to :location

  def to_s
    "#{specification.length} #{specification.manufacturer}"
  end
end
