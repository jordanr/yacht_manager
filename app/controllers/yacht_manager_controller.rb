class YachtManagerController < ApplicationController
  layout :inside_or_outside

  private
    def inside_or_outside
      return "outside_layout" if not (logged_in? and current_user.active?)

      current_user.broker? ? "broker_layout" : "owner_layout"
    end
end
