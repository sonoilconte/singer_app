class WelcomeController < ApplicationController
  def index
    current_user
    @greeting = 'Welcome to the singer app!'
  end
end
