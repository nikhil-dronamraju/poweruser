require "test_helper"

class AuthControllerTest < ActionDispatch::IntegrationTest
  test "should get sign_up" do
    get auth_sign_up_url
    assert_response :success
  end
end
