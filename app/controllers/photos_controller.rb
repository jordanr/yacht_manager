class PhotosController < YachtManagerController
  session :cookie_only => false, :only => :create

  before_filter :active_login_required, :only => [ :create, :update, :destroy ]
  before_filter :get_listing

  def index
    @photos = @listing.photos

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @photos }
    end
  end

  def create
    @photo = @listing.photos.new(params[:photo])
    respond_to do |format|
      if params[:Filedata]
        @photo = @listing.photos.new(:swf_uploaded_data=>params[:Filedata])
        if @photo.save
#          format.html { 
           render :partial =>"flash_response" and return
#          format.xml { render :nothing => true }	
	else
	  format.html { render :action => "new" }
          format.xml { render :xml => @asset.errors, :status => :unprocessable_entity }
	end
      else
        if @photo.save
          flash[:notice] = 'Photos were successfully created.'
          format.html { redirect_to listing_photos_url }
          format.xml  { render :xml => @photo, :status => :created, :location => [@listing, @photo] }
        else
          format.html { render :action => :new }
          format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  def update
    if(params[:id]=="0")
      photos=[]     
      params[:photo].each_pair do |k,v|
        photos.push(Photo.find(k))
      end
      respond_to do |format|      
        if photos.all? { |a| a.update_attributes(params[:photo][a.id.to_s]) }
          flash[:notice] = 'Photos were successfully updated.'
          format.html { redirect_to listing_photos_path }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
        end
      end
    else
      @photo = @listing.photos.find(params[:id])
    
      params[:photo].delete(:image_file) if params[:photo][:image_file]==""
      respond_to do |format|
        if @photo.update_attributes(params[:photo])
          flash[:notice] = 'Photo was successfully updated.'
          format.html { redirect_to listing_photo_path(@listing, @photo) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @listing.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  def destroy
    @photo = @listing.photos.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to(listing_photos_url) }
      format.xml  { head :ok }
    end
  end

  private
    def get_listing
      @listing = Listing.find(params[:listing_id])
    end


end
