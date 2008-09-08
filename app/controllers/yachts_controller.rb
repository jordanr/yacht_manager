class YachtsController < ApplicationController
  # GET /yachts
  # GET /yachts.xml
  def index
    @yachts = Yacht.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @yachts }
    end
  end

  # GET /yachts/1
  # GET /yachts/1.xml
  def show
    @yacht = Yacht.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @yacht }
    end
  end

  # GET /yachts/new
  # GET /yachts/new.xml
  def new
    @yacht = Yacht.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @yacht }
    end
  end

  # GET /yachts/1/edit
  def edit
    @yacht = Yacht.find(params[:id])
  end

  # POST /yachts
  # POST /yachts.xml
  def create
    @yacht = Yacht.new(params[:yacht])

    respond_to do |format|
      if @yacht.save
        flash[:notice] = 'Yacht was successfully created.'
        format.html { redirect_to(@yacht) }
        format.xml  { render :xml => @yacht, :status => :created, :location => @yacht }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @yacht.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /yachts/1
  # PUT /yachts/1.xml
  def update
    @yacht = Yacht.find(params[:id])

    respond_to do |format|
      if @yacht.update_attributes(params[:yacht])
        flash[:notice] = 'Yacht was successfully updated.'
        format.html { redirect_to(@yacht) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @yacht.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /yachts/1
  # DELETE /yachts/1.xml
  def destroy
    @yacht = Yacht.find(params[:id])
    @yacht.destroy

    respond_to do |format|
      format.html { redirect_to(yachts_url) }
      format.xml  { head :ok }
    end
  end
end
