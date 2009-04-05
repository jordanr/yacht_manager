require 'test_helper'

class Transfer
  def do_transfer
    true
  end
  def do_untransfer
    true
  end
end

class TransfersControllerTest < ActionController::TestCase
  module TransferHelper
    class DummySession
      def read(*args); "hi"; end
    end

    def yacht_world_session(*args)
      DummySession.new
    end
    def yacht_council_session(*args)
      DummySession.new
    end
  end

  def setup
    TransfersController.send(:include, TransferHelper)
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
    assert_difference('Transfer.count') do
      post :create, :transfer=>valid_options
    end

    assert_redirected_to transfers_path
  end

  def test_should_show_upload
    get :show, :id => transfers(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => transfers(:one).id
    assert_response :success
  end

  def test_should_update_upload
    put :update, :id => transfers(:one).id, :transfer => { }
    assert_redirected_to transfers_path
  end

  def test_should_destroy_upload
    assert_difference('Transfer.count', -1) do
      delete :destroy, :id => transfers(:one).id
    end
    assert_redirected_to transfers_path
  end

  private
    def valid_options
      {:account_id=>accounts(:one).id, :listing_id=>listings(:one).id}
    end
end
