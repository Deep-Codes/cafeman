class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user

  def self.get_order_price(id, type)
    order_id = Order.where(user_id: id).where(order_status: type).pluck(:id)[0]
    all.find(order_id).order_items.get_total_price
  end

  def self.get_total_items(id, type)
    order_id = Order.where(user_id: id).where(order_status: type).pluck(:id)[0]
    all.find(order_id).order_items.sum(:count)
  end

  def self.get_total_items_count(id)
    Order.find(id).order_items.sum(:count)
  end

  def self.get_total_items_price(id)
    all.find(id).order_items.get_total_price
  end

  def self.get_users_active_order_ids(user_id)
    all.where(user_id: user_id).where(order_status: "queue").ids
  end

  def self.get_users_completed_order_ids(user_id)
    all.where(user_id: user_id).where(order_status: "completed").ids
  end

  # ? Check if orders_items exist in active_menu
  def self.check_if_in_active_menu(id)
    flag = true
    list = []
    active_menu_id = ActiveMenu.first.active_menu
    Order.find(id).order_items.each { |it| list.push(it.menu_item_id) }
    list.each do |id|
      if MenuItem.find(id).menu_id != active_menu_id
        flag = false
      end
    end
    return flag
  end

  # ? Dasboard Methods
  def self.get_all_orders_count
    all.where.not(order_status: "cart").count
  end

  def self.get_profit
    ids_list = Order.where(order_status: "completed").ids
    total_profit = 0
    ids_list.each { |id| total_profit += Order.get_total_items_price(id) }
    return total_profit
  end
end
