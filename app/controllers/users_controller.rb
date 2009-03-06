class UsersController < YachtManagerController
  before_filter :active_login_required, :only => [ :edit ]

  # render new.rhtml
  def new
  end

  def edit
    @user = current_user
  end

  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    @user.save
    if @user.errors.empty?
#      self.current_user = @user
      redirect_to login_path
      flash[:notice] = "Thanks for signing up!  Check your email to activate your account."
    else
      render :action => 'new'
    end
  end

  def activate
    self.current_user = params[:activation_code].blank? ? false : User.find_by_activation_code(params[:activation_code])
    if logged_in? && !current_user.active?
      current_user.activate
      flash[:notice] = "Signup complete!"
    end
    redirect_back_or_default('/')
  end

end
