require 'will_paginate'
class Classified < Listing
  def main_photo
    if photos.count > 0
#      photos.first.small_url
       p = Photo.find_by_sql(["SELECT * FROM photos WHERE listing_id = ? ORDER BY photos.order ASC LIMIT 1", id])
       p.first.public_filename(:tiny)
    else
#      "#{HOST}/images/main_silhouette.gif"
      "/images/main_silhouette.gif"
    end
  end

end
