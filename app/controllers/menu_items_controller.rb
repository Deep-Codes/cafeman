class MenuItemsController < ApplicationController

  # ! For Testing Purpose ONLY
  skip_before_action :verify_authenticity_token

  # ? => /menu_items
  def index
  end

  # ? => /menu_items
  # ? => POST
  def create
    menu_id = params[:menu_id]
    name = params[:name]
    description = params[:description]
    price = params[:price]
    new_menu_item = MenuItem.create!(menu_id: menu_id, name: name, description: description, price: price)
    redirect_to menus_path
  end

  # ? => DELETE
  def destroy
    menu_item_id = params[:id]
    menu_item = MenuItem.find(menu_item_id)
    menu_item.destroy
    redirect_to menus_path
  end
end