class TransfersController < YachtManagerController
  def index
    @uploads = current_user.transfers
  end

  def show
    @upload = current_user.transfers.find(params[:id])
  end

  def new
    @upload = current_user.transfers.new
  end

  def edit
    @upload = current_user.transfers.find(params[:id])
  end

  def create
    @upload = current_user.transfers.new(params[:transfer])

    if @upload.save
      flash[:notice] = 'Transfer was successfully created.'
      redirect_to(transfers_path)
    else
      render :action => "new"
    end
  end

  def update
    @upload = current_user.transfers.find(params[:id])
    if @upload.update_attributes(params[:transfer])
      flash[:notice] = 'Transfer was successfully updated.'
      redirect_to(transfers_path) 
    else
      render :action => "edit"
    end
  end

  def destroy
    @upload = current_user.transfers.find(params[:id])
    @upload.destroy
    redirect_to(transfers_path) 
  end
end
