class ClassifiedsController < ApplicationController

  def index
    @classifieds = Classified.paginate_by_active(true, :page => params[:page], :order=>'yacht_specification_length DESC')
  end

  def show
    @classified = Listing.find(params[:id])
    @details = Detail.paginate_by_listing_id(@classified.id, :page=>params[:page], :per_page=>4) || []
    @photos = @classified.photos || []
  end

end
