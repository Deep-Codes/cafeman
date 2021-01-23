class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :menu_item

  def self.get_total_price
    total_price = 0
    all.each { |o| total_price += o.count * o.menu_item_price }
    total_price
  end

  def self.get_users_active_order(user_id)
    all.where(order_id: Order.where(user_id: user_id).where(order_status: "queue").pluck(:id)[0])
  end
end
