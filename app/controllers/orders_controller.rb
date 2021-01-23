class OrdersController < ApplicationController

  # ! For Testing Purpose ONLY
  skip_before_action :verify_authenticity_token

  # ? => /orders
  def index
    if session[:current_order_id] == nil
      new_order = Order.create(user_id: 2, delivered_at: "", order_status: "cart")
      session[:current_order_id] = new_order.id
    end
  end

  # ? => orders/:id
  # ? => updating order_status
  def update
    id = params[:id]
    order_status = params[:order_status]
    if order_status == "queue"
      Order.find(id).update!(order_status: "queue")
      # ? Destroy the Session once the order is placed
      # ? redirect to users/orders/
      session[:current_order_id] = nil
      redirect_to "/user/orders/"
    elsif order_status == "completed"
      Order.find(id).update!(order_status: "completed")
      redirect_to "/active/orders"
    end
  end
end
