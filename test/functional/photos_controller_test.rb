require 'test_helper'

class PhotosControllerTest < ActionController::TestCase

  def setup
    super
    login_as :aaron
  end

  def test_should_get_index
    get :index, :listing_id => 1
    assert_response :success
    assert_not_nil assigns(:photos)
  end

  def test_should_get_show
    get :show, :listing_id => 1, :id => photos(:one).id
    assert_response :success
    assert_not_nil assigns(:photo)
  end
end
