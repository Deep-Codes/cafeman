require "test_helper"
require_relative "../helpers/helpers.rb"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    # ? Register a new user
    @user = users(:deep)
    signin(users(:deep))
  end

  test "should login a registers user" do
    post "/signin/",
         params: { email: @user.email, password: @user.password_digest }
  end
end
