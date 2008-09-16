require 'test_helper'

class BaseTest < ActiveSupport::TestCase
  def test_create
    mls = multiple_listing_systems(:one)
    assert_difference('mls.accounts.count') do
      create_account(mls.id)
    end
  end

  def test_update_attributes_removes
    mls1 = multiple_listing_systems(:one)
    mls2 = multiple_listing_systems(:two)
    a = accounts(:one)
    mls1.accounts << a
    assert_difference('mls1.accounts.count', -1) do
        update_account(a, mls2.id)
    end
  end

  def test_update_attributes_adds
    mls1 = multiple_listing_systems(:one)
    mls2 = multiple_listing_systems(:two)
    a = accounts(:one)
    mls1.accounts << a
    assert_difference('mls2.accounts.count') do
        update_account(a, mls2.id)
    end
  end

  def test_update_attributes_stays_same
    mls1 = multiple_listing_systems(:one)
    a = accounts(:one)
    mls1.accounts << a
    assert_difference('mls1.accounts.count', 0) do
        update_account(a, mls1.id)
    end
  end

  def test_with_non_ids
    assert_difference('Specification.count', 0) do
      create_specification
    end
  end

  private
    def create_account(mls_id)     
      users(:aaron).accounts.create({ :login => 'quire', :multiple_listing_system_id => mls_id,
        :password => 'quire', :password_confirmation => 'quire' })
    end
    def update_account(a, mls_id)     
      a.update_attributes({ :login => 'quire', :multiple_listing_system_id => mls_id,
        :password => 'quire', :password_confirmation => 'quire' })
    end
    def create_specification 
      Specification.create({ :picture_id=>pictures(:one).id, :description=>"test spec", :type_id=>3,
	:number_of_engines=>2})
    end
end
