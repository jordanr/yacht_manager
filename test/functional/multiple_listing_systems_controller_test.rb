require 'test_helper'

class MultipleListingSystemsControllerTest < ActionController::TestCase
  def setup
    super
    login_as :aaron
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:multiple_listing_systems)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_multiple_listing_system
    assert_difference('MultipleListingSystem.count') do
      post :create, :multiple_listing_system => { }
    end

    assert_redirected_to multiple_listing_system_path(assigns(:multiple_listing_system))
  end

  def test_should_show_multiple_listing_system
    get :show, :id => multiple_listing_systems(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => multiple_listing_systems(:one).id
    assert_response :success
  end

  def test_should_update_multiple_listing_system
    put :update, :id => multiple_listing_systems(:one).id, :multiple_listing_system => { }
    assert_redirected_to multiple_listing_system_path(assigns(:multiple_listing_system))
  end

  def test_should_destroy_multiple_listing_system
    assert_difference('MultipleListingSystem.count', -1) do
      delete :destroy, :id => multiple_listing_systems(:one).id
    end

    assert_redirected_to multiple_listing_systems_path
  end
end
