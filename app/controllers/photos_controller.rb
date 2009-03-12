class PhotosController < YachtManagerController
  session :cookie_only => false, :only => :create

  before_filter :active_login_required
  before_filter :get_listing

  # ajax callback by scriptaculous sorter
  def order
    params[:photo_list].each_with_index { |id, order|
      Photo.find(id).update_attribute(:order, order)
    }
    render :text => :nothing
  end

  def index
    flash[:notice] = "Drag and drop to sort photos."   
    @photos = Photo.find_by_sql(["SELECT * FROM photos WHERE listing_id = ? ORDER BY photos.order ASC", @listing.id])
  end

  def show
    @photo = @listing.photos.find(params[:id])
  end

  def create
    @photo = @listing.photos.new(params[:photo])
    @photo = @listing.photos.new(:swf_uploaded_data=>params[:Filedata])
    if @photo.save
      render :partial =>"flash_response"
    else
      render :text=>"error"
    end
  end

  def update
  end

  def destroy
    @photo = @listing.photos.find(params[:id])
    @photo.destroy
    redirect_to(listing_photos_url)
  end

  private
    def get_listing
      @listing = Listing.find(params[:listing_id])
    end
end
