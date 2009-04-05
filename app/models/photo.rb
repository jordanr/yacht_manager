require 'mime/types'
class Photo < ActiveRecord::Base
  belongs_to :listing

  validate :limit

  def limit
    max = 5
    errors.add_to_base("too many photos: a listing can only have #{max}") if listing_id and listing.photos.size >= max
  end

  after_create :add_order

  has_attachment :content_type => :image, 
                 :storage => :file_system,
		 :size=> 1..10.megabyte,
                 :resize_to => '1000x1000>',
                 :thumbnails => { :thumb => '150x150>', :tiny => '75x75>' },
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

  def to_yt
    { :src => File.open(full_filename, "rb"), :label=>filename }
  end

  private
    def add_order
      update_attribute(:order, id)
    end
end
