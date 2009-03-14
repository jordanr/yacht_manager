class Widget < ActiveRecord::Base
  include ActionView::Helpers::TagHelper

  belongs_to :user

  validates_numericality_of :height, :width
  validates_presence_of :url

  def self.default(user_id)
    create(:width=>900, :height=>600, :url=>"http://myurl.xyz/path_to_widget", :user_id=>user_id)
  end

  def code
    content_tag(:iframe, '', :height=>height, :frameborder=>"0",  :width=> width, :scrolling=>"no", 
	:src=>"#{HOST}/classifieds?per_page=#{height/100}", :marginwidth=>"0", :marginheight=>"0")
  end
end
