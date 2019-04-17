class ApplicationController < ActionController::Base
  # current_user method to use in various controllers
  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      # p "current user is #{@current_user.email}"
    else
      nil
    end
  end

end
