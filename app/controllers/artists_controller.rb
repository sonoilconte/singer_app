class ArtistsController < ApplicationController
  def index
    if session[:user_id]
      @currentUser = User.find(session[:user_id])
      p "current user is #{@currentUser}"
    end
    @artists = Artist.all
  end
end
