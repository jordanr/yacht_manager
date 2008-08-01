class MultipleListingSystemsController < YachtManagerController
  # GET /multiple_listing_systems
  # GET /multiple_listing_systems.xml
  def index
    @multiple_listing_systems = MultipleListingSystem.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @multiple_listing_systems }
    end
  end

  # GET /multiple_listing_systems/1
  # GET /multiple_listing_systems/1.xml
  def show
    @multiple_listing_system = MultipleListingSystem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @multiple_listing_system }
    end
  end

  # GET /multiple_listing_systems/new
  # GET /multiple_listing_systems/new.xml
  def new
    @multiple_listing_system = MultipleListingSystem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @multiple_listing_system }
    end
  end

  # GET /multiple_listing_systems/1/edit
  def edit
    @multiple_listing_system = MultipleListingSystem.find(params[:id])
  end

  # POST /multiple_listing_systems
  # POST /multiple_listing_systems.xml
  def create
    @multiple_listing_system = MultipleListingSystem.new(params[:multiple_listing_system])

    respond_to do |format|
      if @multiple_listing_system.save
        flash[:notice] = 'MultipleListingSystem was successfully created.'
        format.html { redirect_to(@multiple_listing_system) }
        format.xml  { render :xml => @multiple_listing_system, :status => :created, :location => @multiple_listing_system }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @multiple_listing_system.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /multiple_listing_systems/1
  # PUT /multiple_listing_systems/1.xml
  def update
    @multiple_listing_system = MultipleListingSystem.find(params[:id])

    respond_to do |format|
      if @multiple_listing_system.update_attributes(params[:multiple_listing_system])
        flash[:notice] = 'MultipleListingSystem was successfully updated.'
        format.html { redirect_to(@multiple_listing_system) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @multiple_listing_system.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /multiple_listing_systems/1
  # DELETE /multiple_listing_systems/1.xml
  def destroy
    @multiple_listing_system = MultipleListingSystem.find(params[:id])
    @multiple_listing_system.destroy

    respond_to do |format|
      format.html { redirect_to(multiple_listing_systems_url) }
      format.xml  { head :ok }
    end
  end
end
