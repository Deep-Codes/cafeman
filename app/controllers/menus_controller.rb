class MenusController < ApplicationController
  # ? => /menus
  def index
    render plain: Menu.to_list
  end
end
