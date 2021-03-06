require 'test_helper'

class UploadsControllerTest < ActionController::TestCase
  def setup
    super
    login_as :aaron
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:uploads)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_upload
    assert_difference('Upload.count') do
      post :create, :upload=>valid_options
    end

    assert_redirected_to upload_path(assigns(:upload))
  end

  def test_should_show_upload
    get :show, :id => uploads(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => uploads(:one).id
    assert_response :success
  end

  def test_should_update_upload
    put :update, :id => uploads(:one).id, :upload => { }
    assert_redirected_to upload_path(assigns(:upload))
  end

  def test_should_destroy_upload
    l_id = uploads(:one).listing.id
    assert_difference('Upload.count', -1) do
      delete :destroy, :id => uploads(:one).id
    end
    assert Listing.exists?(l_id)
    assert_redirected_to uploads_path
  end

  private
    def valid_options
      {:account_id=>accounts(:one).id, :listing_id=>listings(:one).id}
    end
end
