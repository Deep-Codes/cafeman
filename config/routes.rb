Rails.application.routes.draw do
  get "/" => "home#index"
  resources :menus
  resources :menu_items
  resources :active_menus
  resources :orders
  resources :order_items
  resources :users
  get "/user/orders/", to: "user_orders#index", as: "user_orders"
  get "/active/orders/", to: "active_orders#index", as: "active_orders"
end
