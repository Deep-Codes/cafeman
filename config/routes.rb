Rails.application.routes.draw do
  resources :menus
  resources :menu_items
  resources :active_menus
  resources :orders
  resources :order_items
  get "/user/orders/", to: "user_orders#index", as: "user_orders"
end
