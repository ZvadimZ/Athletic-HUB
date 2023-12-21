class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
    render json: @events
  end

  def show
  end

  def new
    @event = Event.new
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

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Мероприятие успешно обновлено.'
    else
      render edit
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
    params.require(:event).permit(:name, :description, :time, :place)
  end
end
