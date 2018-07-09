class WelcomeController < ApplicationController
  def index
    if session[:user_id]
      @currentUser = User.find(session[:user_id])
      p "current user is #{@currentUser}"
    end
    # user = User.find_by_id(session[:user_id])
    # if user
    #   @currentUser = user[:name]
    #   p 'current user name', @currentUser
    # end
    @greeting = 'Welcome to the singer app!'
  end
end
