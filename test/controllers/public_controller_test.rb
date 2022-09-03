require "test_helper"

class PublicControllerTest < ActionDispatch::IntegrationTest
  test "should get orders" do
    get public_orders_url
    assert_response :success
  end
end
