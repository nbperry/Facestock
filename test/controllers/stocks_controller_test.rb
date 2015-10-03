require 'test_helper'

class StocksControllerTest < ActionController::TestCase
  test "should get stock" do
    get :stock
    assert_response :success
  end

end
