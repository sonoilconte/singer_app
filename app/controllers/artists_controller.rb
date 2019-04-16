class ArtistsController < ApplicationController

  def new
    current_user
    p 'new controller'
  end

  def index
    current_user
    @artists = Artist.all
  end

  def show
    current_user
    artist_id = params[:id]
    @artist = Artist.find_by(id: artist_id)
  end

  def create
    current_user
    artist = Artist.create!(artist_params)
    redirect_to '/artists'
  end

  def edit
    current_user
    artist_id = params[:id]
    @artist = Artist.find_by(id: artist_id)
  end

  def update
    current_user
    artist_id = params[:id]
    p artist_id
    artist = Artist.find_by(id: artist_id)
    p artist
    artist.update_attributes(artist_params)
    redirect_to "/artists/#{params[:id]}"
  end

  def delete
    current_user
    artist_id = params[:id]
    Artist.delete(artist_id)
    redirect_to '/artists'
  end

  def delete_image
    # purge image attachment using the attachment id of the attached image
    artist = Artist.find_by(id: params[:id])
    artist.images.find(params[:image_id]).purge
    redirect_to "/artists/#{params[:id]}/edit"
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

  def show_default
    current_user
    default_artist
  end

  def show_default_bio
    current_user
    default_artist
  end

  def show_default_schedule
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

  def show_default_images
    current_user
    default_artist
  end

  def show_default_contact
    current_user
    default_artist
  end

  private

  def default_artist
    @artist = Artist.find_by(id: 2)
  end

  def artist_params
    params.require(:artist).permit(:name, :voice_type, :bio, :email, :management, images: [])
  end

end
