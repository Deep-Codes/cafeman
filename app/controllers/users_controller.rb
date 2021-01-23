class UsersController < ApplicationController
  def new
    render "users/new"
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    role = params[:role]
    newUser = User.create!(
      name: name,
      email: email,
      password: password,
      role: role,
    )
  end
end
