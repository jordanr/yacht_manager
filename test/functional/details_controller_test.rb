require 'test_helper'

class DetailsControllerTest < ActionController::TestCase
  def setup
    super
    login_as :aaron
  end

  def test_should_get_index
    get :index, :listing_id => 1
    assert_response :success
    assert_not_nil assigns(:details)
  end
end
