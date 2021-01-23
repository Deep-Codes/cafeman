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
end
