class ArtistsController < ApplicationController

  def index
    current_user
    @artists = Artist.all
  end

  def show
    current_user
    artist_id = params[:id]
    @artist = Artist.find_by(id: artist_id)
  end

  def show_default
    current_user
    default_artist
  end

  def show_default_bio
    current_user
    default_artist
  end

  def show_default_resume
    current_user
    default_artist
  end

  def show_default_media
    current_user
    default_artist
  end

  def show_default_contact
    current_user
    default_artist
  end

  # will make this DRYer
  def schedule
    current_user
    artist_id = params[:id]
    @artist = Artist.find_by(id: artist_id)
    # This line simply demonstrating we can access any model
    # Will access the events for a given artist here
    p User.all
  end

  private

  def default_artist
    @artist = Artist.find_by(id: 2)
  end

end
