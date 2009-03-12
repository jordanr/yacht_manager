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

  def dont_test_creates_new
    assert_difference('Photo.count') do
      xml_http_request :post, :create, :listing_id => 1
    end
    assert_template "_flash_response"
  end

  def test_order
    xml_http_request :post, :order, :listing_id => 1, :photo_list => [2, 1]
  end

  def test_delete
    assert_difference('Photo.count', -1) do
      xml_http_request :delete, :destroy, :listing_id => 1, :id=> 1
    end
    assert_redirected_to listing_photos_path(1)
  end

end

