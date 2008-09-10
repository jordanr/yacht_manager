# requires login
class YachtManagerController < ApplicationController
  include YachtManagerHelper
  before_filter :login_required
end
