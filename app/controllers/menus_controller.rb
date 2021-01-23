class MenusController < ApplicationController
  current_user = @current_user

  # ? => /menus
  def index
    if current_user.role == "owner"
      render "index"
    else
      redirect_to orders_path
    end
  end

  # ? => /menus
  # ? POST
  def create
    name = params[:name]
    new_menu = Menu.create!(name: name)
    redirect_to menus_path
  end
end
