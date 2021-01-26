require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:deep)
  end

  test "should register a new user" do
    assert_difference("User.count") do
      post "/users/",
           params: { email: @user.email, password: @user.password_digest, role: @user.role, name: @user.name }
    end
    assert_response :redirect
    follow_redirect!
    assert_equal "/", path
  end
end
