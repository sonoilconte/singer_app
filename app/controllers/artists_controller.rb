class ArtistsController < ApplicationController
  def index
    current_user
    @artists = Artist.all
  end

  def show
    artist_id = params[:id]
    @artist = Artist.find_by(id: artist_id)
  end

end
