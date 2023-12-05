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
    @name = @event_hash['name']
    @place = @event_hash['place']
    @time = @event_hash['time']
    @teams = @event_hash['teams']
    @event_members = @event_hash['eventMembers']
    @user = @event_hash['user']

    if teams.is_a?(Array)
      @teams = teams.map { |team| team['name'] }.join(', ')
    end

    if event_members.is_a?(Array)
      @event_members = event_members.map { |member| member['name'] }.join(', ')
    end
    #@event = Event.new(event_params)
    #if @event.save
      #redirect_to @event, notice: 'Мероприятие успешно создано.'
    #else
      #render :new
    #end
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
