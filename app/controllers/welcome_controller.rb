class WelcomeController < YachtManagerController
  before_filter :active_login_required
  def index
  end
end
