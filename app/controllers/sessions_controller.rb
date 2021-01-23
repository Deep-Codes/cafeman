class SessionsController < ApplicationController
  skip_before_action :ensure_logged_in

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      session[:current_user_role] = user.role
      redirect_to "/"
    else
      render plain: "Incorrect Passowrd"
    end
  end

  # ? Destroying the Session
  def destroy
    session[:current_user_id] = nil
    @current_user = nil
    redirect_to "/"
  end
end
