require 'test_helper'

class AccommodationsControllerTest < ActionController::TestCase
  def setup
    super
    login_as :aaron
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:accommodations)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_accommodation
    assert_difference('Accommodation.count') do
      post :create, :accommodation => { }
    end

    assert_redirected_to accommodation_path(assigns(:accommodation))
  end

  def test_should_show_accommodation
    get :show, :id => accommodations(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => accommodations(:one).id
    assert_response :success
  end

  def test_should_update_accommodation
    put :update, :id => accommodations(:one).id, :accommodation => { }
    assert_redirected_to accommodation_path(assigns(:accommodation))
  end

  def test_should_destroy_accommodation
    assert_difference('Accommodation.count', -1) do
      delete :destroy, :id => accommodations(:one).id
    end

    assert_redirected_to accommodations_path
  end
end
