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
    flash[:notice] = "Drag and drop to sort details."
    @details = Detail.find_by_sql(["SELECT * FROM details WHERE listing_id = ? ORDER BY details.order ASC", @listing.id])
  end

  def create
    @detail = @listing.details.create
    render :partial =>"edit", :locals=>{:edit=>@detail}
  end

  def update
    details=[]
    params[:detail].each_pair do |k,v|
      details.push(@listing.details.find(k))
    end
    if details.all? { |a| a.update_attributes(params[:detail][a.id.to_s]) }
      flash[:notice] = 'Details were successfully updated.'
      redirect_to listing_details_path
    else
      render :action => "edit"
    end
  end

  def destroy
    @detail = @listing.details.find(params[:id])
    @detail.destroy
    redirect_to(listing_details_url)
  end

  private
    def get_listing
      @listing = current_user.listings.find(params[:listing_id])
    end
end
