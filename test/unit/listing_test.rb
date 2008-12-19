require 'test_helper'

class ListingTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_truth
    assert true
  end

  def test_to_yt
    assert listings(:one).to_yt
  end
end
