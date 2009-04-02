class ListingsController < YachtManagerController
  before_filter :active_login_required

  # GET /listings
  # GET /listings.xml
  def index
    @listings = current_user.listings
  end

  # GET /listings/1
  # GET /listings/1.xml
  def show
    @listing = current_user.listings.find(params[:id])
    @details = Detail.paginate_by_listing_id(@listing.id, :page=>params[:page], :per_page=>4, :order=>'details.order ASC') || []
    @photos = Photo.find_by_sql(["SELECT * FROM photos WHERE listing_id = ? ORDER BY photos.order ASC", @listing.id]) || []
  end

  # GET /listings/new
  # GET /listings/new.xml
  def new
    @listing = current_user.listings.new
  end

  # GET /listings/1/edit
  def edit
    @listing = current_user.listings.find(params[:id])
  end

  # POST /listings
  # POST /listings.xml
  def create
    @listing = current_user.listings.new(params[:listing])

    if @listing.save
      flash[:notice] = 'Listing was successfully created.'
      redirect_to(@listing)
    else
      render :action => "new"
    end
  end

  # PUT /listings/1
  # PUT /listings/1.xml
  def update
    @listing = current_user.listings.find(params[:id])
    if @listing.update_attributes(params[:listing])
      flash[:notice] = 'Listing was successfully updated.'
      redirect_to(@listing)
    else
      render :action => "edit"
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.xml
  def destroy
    @listing = current_user.listings.find(params[:id])
    @listing.destroy
    redirect_to(listings_url)
  end
end
