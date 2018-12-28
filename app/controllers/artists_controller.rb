class ArtistsController < ApplicationController
  def index
    current_user
    @artists = Artist.all
  end

  def show
    artist_id = params[:id]
    @artist = Artist.find_by(id: artist_id)
  end

  # will make this DRYer
  def schedule
    artist_id = params[:id]
    @artist = Artist.find_by(id: artist_id)
    # This line simply demonstrating we can access any model
    # Will access the events for a given artist here
    p User.all
  end

end
