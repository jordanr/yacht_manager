class WidgetsController < YachtManagerController
  # GET /widgets
  # GET /widgets.xml
  def index
    @widgets = Widget.all
  end

  # GET /widgets/1
  # GET /widgets/1.xml
  def show
    @widget = current_user.widgets.find(params[:id])
  end

  # GET /widgets/new
  # GET /widgets/new.xml
  def new
    @widget = current_user.widget.new
  end

  # GET /widgets/1/edit
  def edit
    @widget = current_user.widgets.find(params[:id])
  end

  # POST /widgets
  # POST /widgets.xml
  def create
    @widget = current_user.widgets.new(params[:widget])
    if @widget.save
      flash[:notice] = 'Widget was successfully created.'
      redirect_to(@widget)
    else
      render :action => "new"
    end
  end

  # PUT /widgets/1
  # PUT /widgets/1.xml
  def update
    @widget = current_user.widgets.find(params[:id])

    if @widget.update_attributes(params[:widget])
      flash[:notice] = 'Widget was successfully updated.'
      redirect_to(@widget)
    else
      render :action => "edit"
    end
  end

  # DELETE /widgets/1
  # DELETE /widgets/1.xml
  def destroy
    @widget = current_user.widget.find(params[:id])
    @widget.destroy

    redirect_to(widgets_url)
  end
end
