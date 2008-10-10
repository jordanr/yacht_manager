class PicturesController < YachtManagerController
  session :cookie_only => false, :only => :create

  # GET /pictures
  # GET /pictures.xml
  def index
    @pictures = Yacht.find(params[:yacht_id]).pictures.sort

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pictures }
    end
  end

  # GET /pictures/1
  # GET /pictures/1.xml
  def show
    @picture = Picture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @picture }
    end
  end

  # GET /pictures/new
  # GET /pictures/new.xml
  def new
    @picture = Picture.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @picture }
    end
  end

  # GET /pictures/1/edit
  def edit
    @picture = Picture.find(params[:id])
  end

  # POST /pictures
  # POST /pictures.xml
  def create
    @picture = Picture.new(params[:picture])
    respond_to do |format|
      if params[:Filedata]
        @picture = Picture.new(:swf_uploaded_data=>params[:Filedata])
        if @picture.save and @picture.update_attributes({:yacht_id=>params[:yacht_id]})
#          format.html { 
           render :partial =>"flash_response" and return
#          format.xml { render :nothing => true }	
	else
	  format.html { render :action => "new" }
          format.xml { render :xml => @asset.errors, :status => :unprocessable_entity }
	end
      else
        if @picture.save and @picture.update_attributes({:yacht_id=>params[:yacht_id]})
          flash[:notice] = 'Pictures were successfully created.'
          format.html { redirect_to yacht_pictures_url }
          format.xml  { render :xml => @picture, :status => :created, :location => @picture }
        else
          format.html { render :action => :new }
          format.xml  { render :xml => @picture.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # PUT /pictures/1
  # PUT /pictures/1.xml
  def update
    if(params[:id]=="0")
      pictures=[]     
      params[:picture].each_pair do |k,v|
        pictures.push(Picture.find(k))
      end
      respond_to do |format|      
        if pictures.all? { |a| a.update_attributes(params[:picture][a.id.to_s]) }
          flash[:notice] = 'Pictures were successfully updated.'
          format.html { redirect_to yacht_pictures_path }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @picture.errors, :status => :unprocessable_entity }
        end
      end
    else
      @picture = Picture.find(params[:id])
    
      params[:picture].delete(:image_file) if params[:picture][:image_file]==""
      respond_to do |format|
        if @picture.update_attributes(params[:picture])
          flash[:notice] = 'Picture was successfully updated.'
          format.html { redirect_to yacht_picture_path(@picture.yacht.id, @picture.id) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @picture.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.xml
  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy

    respond_to do |format|
      format.html { redirect_to(yacht_pictures_url) }
      format.xml  { head :ok }
    end
  end
end
