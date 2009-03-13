class Widget < ActiveRecord::Base
  include ActionView::Helpers::TagHelper
  
  belongs_to :user

  validates_numericality_of :width, :height
  validates_presence_of :url

  def self.default(user_id)
    create(:height=>600, :width=>900, :user_id=>user_id, :url=>"http://your_url/path_to_widget")
  end

  def code
    content_tag('iframe', "", :frameborder=>0, :height=>height, :width=>width,:scrolling=>"no", :marginwidth=>0, 
				:marginheight=>0, :src=>"#{HOST}/classfieds?per_page=#{height/100}")
  end

  def preview
    content_tag('iframe', "", :frameborder=>0, :height=>"1000", :width=>"100%", :marginheight=>0,:marginwidth=>0, :scrolling=>"no", :src=>"#{url}")
  end
end
