# requires login
class YachtManagerController < ApplicationController
  before_filter :active_login_required
end
