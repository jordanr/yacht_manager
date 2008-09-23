require 'mime/types'
class Picture < ActiveRecord::Base
  belongs_to :yacht

  has_attachment :content_type => :image, 
                 :storage => :file_system,
		 :size=> 1..10.megabyte

  validates_as_attachment

  #????  named_scope :masters, :conditions => {:parent_id => nil}
  
  # Map file extensions to mime types.
  # Thanks to bug in Flash 8 the content type is always set to application/octet-stream.
  # From: http://blog.airbladesoftware.com/2007/8/8/uploading-files-with-swfupload
  def swf_uploaded_data=(data)
    data.content_type = MIME::Types.type_for(data.original_filename)
    self.uploaded_data = data
  end
end
