class YachtManagerController < ApplicationController
  layout :inside_or_outside

  private
    def inside_or_outside
      logged_in? && current_user.active? ? "inside_layout" : "outside_layout"
    end
end
