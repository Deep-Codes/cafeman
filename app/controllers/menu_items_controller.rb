class MenuItemsController < ApplicationController
  # ? => /menu_items
  def index
    render plain: "MenuItems Page"
  end
end
