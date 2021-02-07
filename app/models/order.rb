class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user

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
    is_order_still_valid = true
    list = []
    active_menu_id = ActiveMenu.first.active_menu
    Order.find(id).order_items.each { |it| list.push(it.menu_item_id) }
    list.each do |id|
      if MenuItem.find(id).menu_id != active_menu_id
        is_order_still_valid = false
      end
    end
    return is_order_still_valid
  end

  # ? Dasboard Methods
  def self.get_all_orders_count
    all.where.not(order_status: "cart").count
  end

  def self.get_profit
    completed_orders = Order.where(order_status: "completed").joins(:order_items)
    total_profit = completed_orders.sum("order_items.count * order_items.menu_item_price")
  end
end
