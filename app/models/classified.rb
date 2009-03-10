require 'will_paginate'
class Classified < Listing
  cattr_reader :per_page
  @@per_page = 20 

  def main_photo
    if photos.count > 0
      photos.first.small_url
    else
      "#{HOST}/images/main_silhouette.gif"
    end
  end

end
