class ArtistsController < ApplicationController

  def new
    active_user = current_user
    redirect_to '/login' unless active_user && active_user.email == ENV['ADMIN_EMAIL']
    p 'new controller'
  end

  def index
    active_user = current_user
    redirect_to '/login' unless active_user && active_user.email == ENV['ADMIN_EMAIL']
    @artists = Artist.all
  end

  def show
    redirect_to '/login' unless current_user.email == ENV['ADMIN_EMAIL']
    @artist = Artist.find_by(id: params[:id])
  end

  def create
    redirect_to '/login' unless current_user.email == ENV['ADMIN_EMAIL']
    artist = Artist.create!(artist_params)
    redirect_to '/artists'
  end

  def edit
    active_user = current_user
    redirect_to '/login' unless active_user && active_user.artists.exists?(params[:id])
    @artist = Artist.find_by(id: params[:id])
  end

  def update
    redirect_to '/login' unless current_user
    if current_user.artists.exists?(params[:id])
      puts "ALLOWED USER"
    else
      puts "NOT ALLOWED USER"
    end
    artist = Artist.find_by(id: params[:id])
    p "updating artist #{artist}"
    artist.update_attributes(artist_params)
    # redirect_to "/artists/#{params[:id]}"
    redirect_to '/'
  end

  def delete
    redirect_to '/login' unless current_user.email == ENV['ADMIN_EMAIL']
    Artist.delete(params[:id])
    redirect_to '/artists'
  end

  def delete_image
    redirect_to '/login' unless current_user
    # purge image attachment using the attachment id of the attached image
    artist = Artist.find_by(id: params[:id])
    artist.images.find(params[:image_id]).purge
    redirect_to "/artists/#{params[:id]}/edit"
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
    @artist = Artist.find_by(email: ENV['PRIMARY_USER_EMAIL'])
  end

  def artist_params
    params.require(:artist).permit(:name, :voice_type, :bio, :email, :schedule, :management, images: [])
  end

end
