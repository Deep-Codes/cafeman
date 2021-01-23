class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user

  def self.get_order_price(id)
    all.find(id).order_items.get_total_price
  end

  def self.get_total_items(id)
    all.find(id).order_items.sum(:count)
  end
end
