class EventsController < ApplicationController

  def index
    redirect_unauthorized_user(current_user, params[:id])
    events = Event.where(artist_id: params[:id])
    @events = events.sort_by { |event| event.datetime }
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
    redirect_to "/artists/#{params[:id]}/events"
  end

  def edit
    redirect_unauthorized_user(current_user, params[:id])
    @event = Event.find_by(id: params[:event_id])
  end

  def update
    redirect_unauthorized_user(current_user, params[:id])
    event = Event.find_by(id: params[:event_id])
    if event.update_attributes(event_params)
      flash[:notice] = "Event info saved"
    end
    redirect_to "/artists/#{params[:id]}/events/#{params[:event_id]}/edit"
  end

  def delete
    redirect_unauthorized_user(current_user, params[:id])
    Event.delete(params[:event_id])
    redirect_to "/artists/#{params[:id]}/events"
  end

  private

  def event_params
    params.require(:event).permit(:title, :url, :datetime, :description, :image, :archived, :artist_id)
  end
end
