class MenuItem < ActiveRecord::Base
  belongs_to :menu

  # ? Shows Menu Based on menu_id
  def self.menu_by_id(id)
    all.where(menu_id: id)
  end
end
