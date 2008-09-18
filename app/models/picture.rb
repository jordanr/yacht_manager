class Picture < ActiveRecord::Base
  belongs_to :yacht

  MEGABYTE = 1048576

  validates_length_of :binary_data, :maximum=>MEGABYTE/2

  def image_file=(input_data) 
    self.filename = input_data.original_filename 
    self.content_type = input_data.content_type.chomp 
    self.binary_data = input_data.read 
  end 
end
