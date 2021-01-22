class OrderItemsController < ApplicationController

  # ! For Testing Purpose ONLY
  skip_before_action :verify_authenticity_token

  def create
    order_id = params[:order_id]
    menu_item_id = params[:menu_item_id]
    menu_item_name = params[:menu_item_name]
    menu_item_price = params[:menu_item_price]

    item_existing_in_cart = OrderItem.where(order_id: order_id).find_by(menu_item_id: menu_item_id)

    # * If Does not OrderItem Exists
    # * Add a Fresh new OrderItem in the cart
    if item_existing_in_cart == nil
      OrderItem.create!(
        order_id: order_id,
        menu_item_id: menu_item_id,
        menu_item_name: menu_item_name,
        menu_item_price: menu_item_price,
        count: 1,
      )
      redirect_to orders_path
      # * If  OrderItem Exists
      # * Update the Count of item
    else
      id = item_existing_in_cart.id
      count = item_existing_in_cart.count
      OrderItem.find(id).update!(count: count + 1)
      redirect_to orders_path
    end
  end

  def update
    id = params[:id]
    order_menu_count = params[:count]
    new_order_item = OrderItem.find(id)
    new_order_item.update!(count: order_menu_count)
    # redirect_to orders_path
  end

  def destroy
    id = params[:id]
    OrderItem.find(id).destroy
    redirect_to orders_path
  end
end
