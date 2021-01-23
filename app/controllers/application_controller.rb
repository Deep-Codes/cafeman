class ApplicationController < ActionController::Base
  before_action :ensure_logged_in

  def ensure_logged_in
    # ? halt that request cycle
    unless current_user
      redirect_to "/"
    end
  end

  # ? Memoization
  def current_user
    return @current_user if @current_user
    current_user_id = session[:current_user_id]
    if current_user_id
      @current_user = User.find(current_user_id)
    else
      nil
    end
  end
end
