class OrdersController < ApplicationController

  # ? => /orders
  def index
    if session[:current_order_id] == nil
      new_order = Order.create(user_id: 2, delivered_at: "", order_status: "cart")
      session[:current_order_id] = new_order.id
    end
  end
end
