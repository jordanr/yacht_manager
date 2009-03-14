class AccountsController < YachtManagerController
  before_filter :active_login_required

  # GET /accounts
  # GET /accounts.xml
  def index
    @accounts = current_user.accounts
  end

  # GET /accounts/1
  # GET /accounts/1.xml
  def show
    @account = current_user.accounts.find(params[:id])
  end

  # AJAX
  def decrypt
    @account = current_user.accounts.find(params[:id])
    render :text => @account.decrypt_password
  end

  # GET /accounts/new
  # GET /accounts/new.xml
  def new
    @account = current_user.accounts.new
  end

  # GET /accounts/1/edit
  def edit
    @account = current_user.accounts.find(params[:id])
  end

  # POST /accounts
  # POST /accounts.xml
  def create
    @account = current_user.accounts.new(params[:account])
    if @account.save
      flash[:notice] = 'Account was successfully created.'
      redirect_to(accounts_path)
    else
      render :action => "new"
    end
  end

  # PUT /accounts/1
  # PUT /accounts/1.xml
  def update
    @account = current_user.accounts.find(params[:id])
    
    if @account.update_attributes(params[:account])
      flash[:notice] = 'Account was successfully updated.'
      redirect_to(accounts_path)
    else
      render :action => "edit"
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.xml
  def destroy
    @account = current_user.accounts.find(params[:id])
    @account.destroy
    redirect_to(accounts_url)
  end
end
