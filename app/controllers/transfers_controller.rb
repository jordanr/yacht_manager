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
    @transfer = current_user.transfers.find(params[:id])
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
    @transfer = current_user.transfers.find(params[:id])
    if @transfer.update_attributes(params[:transfer])
      flash[:notice] = 'Transfer was successfully updated.'
      redirect_to(transfers_path) 
    else
      render :action => "edit"
    end
  end

  def destroy
    @upload = current_user.transfers.find(params[:id])
    if @upload.destroy
      flash[:notice] = 'Transfer was successfully destroyed'
    else
      flash[:error] = 'Transfer could not be destroyed'
    end
    redirect_to(transfers_path) 
  end
end
