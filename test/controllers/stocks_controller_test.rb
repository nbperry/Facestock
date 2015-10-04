require 'test_helper'

class StocksControllerTest < ActionController::TestCase
  test "should get stock" do
    get :stock
  end
  test "should get index" do
    get :index
    assert_response :success
  end

end
