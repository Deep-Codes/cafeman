class MenuItem < ActiveRecord::Base
  belongs_to :menu

  def show_menu_item
    "#{id}:- #{name} | #{price} | #{description}"
  end
end
