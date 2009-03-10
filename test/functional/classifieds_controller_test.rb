require 'test_helper'

class ClassifiedsControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  def test_gets_all
    get :index
    assert_response :success
    assert_equal assigns(:classifieds).size, 1
  end

  def test_gets_show
    get :show, :id=> 1
    assert_response :success
    assert assigns(:classified)
    assert assigns(:details)
    assert assigns(:photos)
  end

end
