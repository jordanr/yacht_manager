require 'test_helper'

class UploadTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_truth
    assert true
  end

  def test_created_dirty
    assert uploads(:one).dirty?
  end

  def test_update_dirty
    assert !uploads(:two).dirty?
    uploads(:two).update_attribute(:listing_id, 2)
    assert uploads(:two).dirty?
  end   
end
