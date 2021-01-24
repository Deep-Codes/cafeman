class MenusController < ApplicationController

  # ? => /menus
  def index
    if current_user.is_owner?
      render "index"
    else
      redirect_to orders_path
    end
  end

  # ? => /menus
  # ? POST
  def create
    name = params[:name]
    new_menu = Menu.new(name: name)
    new_menu.save
    if new_menu.save
      redirect_to menus_path
    else
      flash[:error] = new_menu.errors.full_messages.join(" , ")
      redirect_to menus_path
    end
  end
end
