# requires login
class YachtManager < ApplicationController
  before_filter :login_required
end
