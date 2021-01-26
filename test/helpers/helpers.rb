def signin(user)
  post "/users/",
    params: { email: user.email, password: user.password_digest, role: user.role, name: user.name }
end

def create_menu
  post "/menus/",
    params: { name: "test_menu" }
end

def create_order
  new_order = Order.create(user_id: User.first.id, delivered_at: "", order_status: "cart")
  new_order.id
end
