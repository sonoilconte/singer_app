class ArtistsController < ApplicationController
  def index
    current_user
    @artists = Artist.all
  end
end
