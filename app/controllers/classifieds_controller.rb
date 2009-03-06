class ClassifiedsController < ApplicationController

  def index
    @classifieds = Listing.all
  end

  def show
    @classified = Listing.find(params[:id])
    @details = @classified.details || []
    @photos = @classified.photos || []
  end

end
