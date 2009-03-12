require 'test_helper'

class InformationControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  def test_gets_owners
    get :owners
    assert_response :success
  end
  def test_gets_brokers
    get :brokers
    assert_response :success
  end
  def test_gets_devels
    get :developers
    assert_response :success
  end
end
