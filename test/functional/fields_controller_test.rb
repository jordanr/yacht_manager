require 'test_helper'

class FieldsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:fields)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_field
    assert_difference('Field.count') do
      post :create, :field => { }
    end

    assert_redirected_to field_path(assigns(:field))
  end

  def test_should_show_field
    get :show, :id => fields(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => fields(:one).id
    assert_response :success
  end

  def test_should_update_field
    put :update, :id => fields(:one).id, :field => { }
    assert_redirected_to field_path(assigns(:field))
  end

  def test_should_destroy_field
    assert_difference('Field.count', -1) do
      delete :destroy, :id => fields(:one).id
    end

    assert_redirected_to fields_path
  end
end
