require 'mime/types'
class Picture < ActiveRecord::Base
  belongs_to :yacht

  has_attachment :content_type => :image, 
                 :storage => :file_system,
		 :size=> 1..10.megabyte,
                 :resize_to => '800x600>',
                 :thumbnails => { :thumb => '150x150>' },
		 :processor=> :MiniMagick

  validates_as_attachment

  #????  named_scope :masters, :conditions => {:parent_id => nil}
  
  # Map file extensions to mime types.
  # Thanks to bug in Flash 8 the content type is always set to application/octet-stream.
  # From: http://blog.airbladesoftware.com/2007/8/8/uploading-files-with-swfupload
  def swf_uploaded_data=(data)
    data.content_type = MIME::Types.type_for(data.original_filename)
    self.uploaded_data = data
  end

  def <=>(o)
    order <=> o.order
  end

  def to_yt
    {:label=>description, :src=>open_full_picture}.delete_bad_values   
  end

  def open_full_picture
    ::File.open(full_filename, "rb") { |f| f.read }
  end
end
