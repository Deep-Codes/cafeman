class OrdersController < ApplicationController

  # ? => /orders
  def index
    session[:current_order_id] = 10
  end
end
