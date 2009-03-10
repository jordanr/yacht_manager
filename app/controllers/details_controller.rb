class DetailsController < YachtManagerController

  before_filter :get_listing
  before_filter :active_login_required

  # ajax callback by scriptaculous sorter
  def order
    params[:detail_list].each_with_index { |id, order|
      Detail.find(id).update_attribute(:order, order)
    }
    render :text => :nothing
  end 

  def index
    @details = Detail.find_by_sql(["SELECT * FROM details WHERE listing_id = ? ORDER BY details.order ASC", @listing.id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @details }
    end
  end

  def create
    if request.xhr?
      @detail = @listing.details.create
      render :partial =>"edit", :locals=>{:edit=>@detail} and return
    end
    @detail = @listing.details.new(params[:detail])

    respond_to do |format|
      if @detail.save
        flash[:notice] = 'Detail was successfully created.'
        format.html { redirect_to listing_detail_path(@listing, @detail) }
        format.xml  { render :xml => @detail, :status => :created, :location => [@listing, @detail] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    if(params[:id]=="0")
      details=[]
      params[:detail].each_pair do |k,v|
        details.push(@listing.details.find(k))
      end
      respond_to do |format|
        if details.all? { |a| a.update_attributes(params[:detail][a.id.to_s]) }
          flash[:notice] = 'Details were successfully updated.'
          format.html { redirect_to listing_details_path } 
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @detail.errors, :status => :unprocessable_entity }
        end
      end
    else	
      @detail = @listing.details.find(params[:id])

      respond_to do |format|
        if @detail.update_attributes(params[:detail])
          flash[:notice] = 'Detail was successfully updated.'
          format.html { redirect_to listing_detail_path(@listing, @detail) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @detail.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  def destroy
    @detail = @listing.details.find(params[:id])
    @detail.destroy

    respond_to do |format|
      format.html { redirect_to(listing_details_url) }
      format.xml  { head :ok }
    end
  end

  private
    def get_listing
      @listing = Listing.find(params[:listing_id])
    end

end
