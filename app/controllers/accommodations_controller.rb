class AccommodationsController < YachtManagerController
  # GET /accommodations
  # GET /accommodations.xml
  def index
    @accommodations = Yacht.find(params[:yacht_id]).accommodations

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @accommodations }
    end
  end

  # GET /accommodations/1
  # GET /accommodations/1.xml
  def show
    @accommodation = Accommodation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @accommodation }
    end
  end

  # GET /accommodations/new
  # GET /accommodations/new.xml
  def new
    @accommodation = Accommodation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @accommodation }
    end
  end

  # GET /accommodations/1/edit
  def edit
    @accommodation = Accommodation.find(params[:id])
  end

  # POST /accommodations
  # POST /accommodations.xml
  def create
    if request.xhr?
      yacht = Yacht.find(params[:yacht_id])
      @accommodation = yacht.accommodations.create
      render :partial =>"edit", :locals=>{:edit=>@accommodation} and return
    end
    @accommodation = Accommodation.new(params[:accommodation])

    respond_to do |format|
      if @accommodation.save and @accommodation.update_attributes({:yacht_id=>params[:yacht_id]})
        flash[:notice] = 'Accommodation was successfully created.'
        format.html { redirect_to yacht_accommodation_path(@accommodation.yacht.id, @accommodation.id) }
        format.xml  { render :xml => @accommodation, :status => :created, :location => @accommodation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @accommodation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /accommodations/1
  # PUT /accommodations/1.xml
  def update
    if(params[:id]=="0")
      accommodations=[]
      params[:accommodation].each_pair do |k,v|
	puts k.inspect, v.inspect
        accommodations.push(Accommodation.find(k))
      end
      respond_to do |format|
        if accommodations.all? { |a| a.update_attributes(params[:accommodation][a.id]) }
          flash[:notice] = 'Accommodations were successfully updated.'
          format.html { redirect_to yacht_accommodations_path } 
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @accommodation.errors, :status => :unprocessable_entity }
        end
      end
    else	
      @accommodation = Accommodation.find(params[:id])

      respond_to do |format|
        if @accommodation.update_attributes(params[:accommodation])
          flash[:notice] = 'Accommodation was successfully updated.'
          format.html { redirect_to yacht_accommodation_path(@accommodation.yacht.id, @accommodation.id) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @accommodation.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /accommodations/1
  # DELETE /accommodations/1.xml
  def destroy
    @accommodation = Accommodation.find(params[:id])
    @accommodation.destroy

    respond_to do |format|
      format.html { redirect_to(yacht_accommodations_url) }
      format.xml  { head :ok }
    end
  end
end
