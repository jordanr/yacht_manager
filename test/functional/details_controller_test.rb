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

  def test_creates_new
    assert_difference('Detail.count') do
      xml_http_request :post, :create, :listing_id => 1
    end
    assert_template "_edit"
  end

  def test_order
    xml_http_request :post, :order, :listing_id => 1, :detail_list => [2, 1]
  end

  def test_delete
    assert_difference('Detail.count', -1) do
      xml_http_request :delete, :destroy, :listing_id => 1, :id=> 1
    end
    assert_redirected_to listing_details_path(1)
  end

end
