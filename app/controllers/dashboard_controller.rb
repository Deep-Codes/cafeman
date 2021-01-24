class DashboardController < ApplicationController
  current_user = @current_user

  def index
    if current_user.role == "owner"
      render "index"
    else
      redirect_to orders_path
    end
  end
end
