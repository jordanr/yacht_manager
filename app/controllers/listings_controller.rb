class ListingsController < YachtManagerController
  ASSOCIATED_MODELS = [:listing, :price, :yacht, :location, :specification, :accommodation, :picture]

  # GET /listings
  # GET /listings.xml
  def index
    @listings = current_user.listings.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @listings }
    end
  end

  # GET /listings/1
  # GET /listings/1.xml
  def show
    @listing = current_user.listings.find(params[:id])
    @price = @listing.current_price
    @yacht = @listing.yacht
    @location = @yacht.location
    @specification = @yacht.specification

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @listing }
    end
  end

  # GET /listings/new
  # GET /listings/new.xml
  def new
    @listing = current_user.listings.new
    @price = @listing.prices.new
    @yacht = Yacht.new
    @location = Location.new
    @specification = Specification.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @listing }
    end
  end

  # GET /listings/1/edit
  def edit
    @listing = current_user.listings.find(params[:id])
    @price = @listing.current_price
    @yacht = @listing.yacht
    @location = @yacht.location
    @specification = @yacht.specification
  end

  # POST /listings
  # POST /listings.xml
  def create
    @specification = Specification.new(params[:specification])
    @location = Location.new(params[:location])
    @yacht = Yacht.new(params[:yacht])
    @listing = current_user.listings.new(params[:listing])
    @price = Price.new(params[:price])
#    @accommodation = Accommodation.new
 #   @picture = Picture.new

    respond_to do |format|
      if @listing.save and @price.save and @yacht.save and @location.save and @specification.save and
 #        @accommodation.save and @picture.save and
	 @yacht.update_attributes({:location_id=>@location.id, :specification_id=>@specification.id}) and
	 @listing.update_attributes({:yacht_id=>@yacht.id}) and 
	 @price.update_attributes({:listing_id=>@listing.id})
#	 @accommodation.update_attributes({:yacht_id=>@yacht.id}) and @picture.update_attributes({:yacht_id=>@yacht.id})
        flash[:notice] = 'Listing was successfully created.'
        format.html { redirect_to(@listing) }
        format.xml  { render :xml => @listing, :status => :created, :location => @listing }
      else
        @listing.destroy
        @price.destroy
        @specification.destroy
	@location.destroy
        @yacht.destroy
	
        format.html { render :action => "new" }
        format.xml  { render :xml => @listing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /listings/1
  # PUT /listings/1.xml
  def update
    @listing = current_user.listings.find(params[:id])
    @price = @listing.current_price
    @yacht = @listing.yacht
    @location = @yacht.location
    @specification = @yacht.specification
    respond_to do |format|
      if @listing.update_attributes(params[:listing]) and @location.update_attributes(params[:location]) and 
         @yacht.update_attributes(params[:yacht]) and 
	 @specification.update_attributes(params[:specification]) and 
	 @price.update_attributes(params[:price])
        flash[:notice] = 'Listing was successfully updated.'
        format.html { redirect_to(@listing) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @listing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.xml
  def destroy
    @listing = current_user.listings.find(params[:id])
    @listing.destroy

    respond_to do |format|
      format.html { redirect_to(listings_url) }
      format.xml  { head :ok }
    end
  end
end
