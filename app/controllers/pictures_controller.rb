class PicturesController < YachtManagerController
  # GET /pictures
  # GET /pictures.xml
  def index
    @pictures = Yacht.find(params[:yacht_id]).pictures

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
    i = 0
    pictures = []
    files = params.find_all { |k,v| v!="" and k.to_s.match(/file_[0-9]+/) }
    files.each do |f|
      p = Picture.new({:image_file => f.pop })
      pictures.push(p)
      i+=1
    end

    respond_to do |format|
      if pictures.all? { |picture| picture.save and picture.update_attributes({:yacht_id=>params[:yacht_id]}) }
        flash[:notice] = 'Pictures were successfully created.'
        format.html { redirect_to yacht_pictures_url }
        format.xml  { render :xml => @picture, :status => :created, :location => @picture }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @picture.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pictures/1
  # PUT /pictures/1.xml
  def update
    @picture = Picture.find(params[:id])
    
#    puts params[:picture].[:image_file].to_s
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

  def code_image 
    @image_data = Picture.find(params[:id]) 
    @image = @image_data.binary_data
    send_data(@image, :type => @image_data.content_type, :filename => @image_data.filename, :disposition => 'inline') 
  end
end
