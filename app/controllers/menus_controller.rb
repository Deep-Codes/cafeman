class MenusController < ApplicationController
  # ? => /menus
  def index
  end

  # ? => /menus
  # ? POST
  def create
    name = params[:name]
    new_menu = Menu.create!(name: name)
    redirect_to menus_path
  end
end
