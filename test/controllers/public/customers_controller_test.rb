require "test_helper"

class Public::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_customers_show_url
    assert_response :success
  end

  test "should get editcheck" do
    get public_customers_editcheck_url
    assert_response :success
  end
end
