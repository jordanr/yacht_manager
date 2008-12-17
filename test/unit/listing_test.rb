require 'test_helper'

class ListingTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_truth
    assert true
  end

  def test_to_yt
    puts listings(:one).to_yt.inspect
  end
end
