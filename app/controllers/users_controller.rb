class UsersController < ApplicationController
  skip_before_action :ensure_logged_in

  def new
    render "users/new"
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    role = params[:role]
    new_user = User.create!(
      name: name,
      email: email,
      password: password,
      role: role,
    )
    if new_user.save
      session[:current_user_id] = new_user.id
      session[:current_user_role] = new_user.role
      redirect_to "/"
    end
  end
end
