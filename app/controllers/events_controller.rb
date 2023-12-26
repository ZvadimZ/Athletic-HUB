class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  def index
    @events = Event.all
    render json: @events
  end

  def show
  end

  def create
    @event_hash = JSON.parse(request.body.read)
    @event = Event.new(@event_hash)
    if @event.save
      render json: @event, status: :created
    else
      render json: @event, status: :conflict
    end
  end

  def update
    if @event.update(event_params) && @event.user_id == @current_user.id
      render json: @event, status: :ok
    else
      render json: :@event, status: :unprocessable_entity
    end
  end

  def destroy
    if @current_user.id == @event.user_id
      @event.destroy
      render json: @event, status: 204
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :placeUrl, :time, :count_members,
                                  :user_id, :registration_start_time,
                                  :registration_close_time, :text, :imagePath)
  end
end
