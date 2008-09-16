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

  private
    def create_listing
      post :create, valid_options
    end
    def valid_options
      {:listing => {:status_id=>1}, :yacht=>{:name=>"test"}, :price=>{:currency_id=>1, :value=>123},
       :location=>{:city=>"Miami", :state_id=>1, :country_id=>1}, 
       :specification=>{:hull_material_id=>1,:type_id=>1, :length_units_id=>1, :weight_units_id=>1,
	 :volume_units_id=>1, :speed_units_id=>1, :engine_fuel_id=>1, :number_of_engines=>1, :year=>1111,
	 :manufacturer=>"test", :length=>1, :engine_year=>1111}
      }
    end
end
