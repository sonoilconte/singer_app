class EventsController < ApplicationController

  def index
    redirect_unauthorized_user(current_user, params[:id])
    @events = Event.where(artist_id: params[:id])
  end

  def show
    redirect_unauthorized_user(current_user, params[:id])
    @event = Event.find_by(id: params[:event_id])
  end

  def new
    redirect_unauthorized_user(current_user, params[:id])
  end

  def create
    redirect_unauthorized_user(current_user, params[:id])
    event = Event.create!(event_params)
    redirect_to "/artists/#{params[:id]}/events/#{event.id}"
  end

  def edit
    redirect_unauthorized_user(current_user, params[:id])
  end

  def update
    redirect_unauthorized_user(current_user, params[:id])
  end

  def delete
    redirect_unauthorized_user(current_user, params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:title, :url, :datetime, :description, :image, :archived, :artist_id)
  end
end
