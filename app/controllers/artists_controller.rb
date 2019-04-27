class ArtistsController < ApplicationController

  def index
    redirect_non_admin(current_user)
    @artists = Artist.all
  end

  def show
    redirect_non_admin(current_user)
    @artist = Artist.find_by(id: params[:id])
  end

  def new
    redirect_non_admin(current_user)
  end

  def create
    redirect_non_admin(current_user)
    artist = Artist.create!(artist_params)
    redirect_to '/artists'
  end

  def edit
    redirect_unauthorized_user(current_user, params[:id])
    @artist = Artist.find_by(id: params[:id])
  end

  def update
    redirect_unauthorized_user(current_user, params[:id])
    artist = Artist.find_by(id: params[:id])
    if artist.update_attributes(artist_params)
      flash[:notice] = "Artist info saved"
    end
    # Keep user on the edit artist page after a content update
    redirect_to "/artists/#{params[:id]}/edit"
  end

  def delete
    redirect_non_admin(current_user)
    Artist.delete(params[:id])
    redirect_to '/artists'
  end

  def delete_image
    redirect_unauthorized_user(current_user, params[:id])
    # purge image attachment using the attachment id of the attached image
    artist = Artist.find_by(id: params[:id])
    artist.images.find(params[:image_id]).purge
    # Keep user on the edit artist page after deleting an image
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
    artist_id = default_artist.id
    @events = Event.where(artist_id: artist_id).sort_by { |event| event.datetime }
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
    params.require(:artist).permit(:name, :voice_type, :bio, :biography, :email, :schedule, :management, images: [])
  end

end
