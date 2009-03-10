class ClassifiedsController < ApplicationController

  def index
    @classifieds = Classified.paginate_by_active(true, :page => params[:page], :order=>'yacht_specification_length DESC')
  end

  def show
    @classified = Listing.find(params[:id])

    @details = Detail.paginate_by_listing_id(@classified.id, :page=>params[:page], :per_page=>4, :order=>'details.order ASC') || []
    @photos = Photo.find_by_sql(["SELECT * FROM photos WHERE listing_id = ? ORDER BY photos.order ASC", @classified.id]) || []
  end

end
