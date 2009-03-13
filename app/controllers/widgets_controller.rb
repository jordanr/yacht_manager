class WidgetsController < YachtManagerController
  before_filter :active_login_required
  def index
    @widget = current_user.widget || Widget.default(current_user.id)
  end

  # PUT /widgets/1
  # PUT /widgets/1.xml
  def update
    @widget = current_user.widget

    if @widget.update_attributes(params[:widget])
      flash[:notice] = 'Widget was successfully updated.'
    end
    redirect_to(widgets_url)
  end
end
