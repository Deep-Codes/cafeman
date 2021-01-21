class ActiveMenusController < ApplicationController

  # ! For Testing Purpose ONLY
  skip_before_action :verify_authenticity_token

  # ? => /active_menus
  # ? GET
  def index
    render plain: "Hello from Active Menus Route"
  end

  # ? => /active_menus
  # ? PUT
  def update
    new_active_menu = params[:menu_id]
    ActiveMenu.first.update(active_menu: new_active_menu)
    redirect_to menus_path
  end
end
