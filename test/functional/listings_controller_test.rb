require 'test_helper'

class ListingsControllerTest < ActionController::TestCase
  def setup
    super
    login_as :aaron
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:listings)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_listing
    assert_difference('Listing.count') do
      create_listing
    end

    assert_redirected_to listing_path(assigns(:listing))
  end

  def test_should_show_listing
    get :show, :id => listings(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => listings(:one).id
    assert_response :success
  end

  def test_should_update_listing
    put :update, valid_options.merge!({:id => listings(:one).id})
    assert_redirected_to listing_path(assigns(:listing))
  end

  def test_should_destroy_listing
    assert_difference('Listing.count', -1) do
      delete :destroy, :id => listings(:one).id
    end

    assert_redirected_to listings_path
  end

  def test_should_create_listing
    assert_difference('Listing.count') do
      create_listing_blank
    end

    assert_redirected_to listing_path(assigns(:listing))
  end

  private
    def create_listing
      post :create, valid_options
    end
    def create_listing_blank
      post :create
    end
    def valid_options
      {:listing=>{:price=>4444, :yacht_specification_year=>2000, :yacht_specification_length=>33}}
    end
end
