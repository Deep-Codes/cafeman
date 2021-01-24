class DashboardController < ApplicationController
  def index
    if current_user.role == "owner"
      render "index"
    else
      redirect_to orders_path
    end
  end
end
