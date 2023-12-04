class TeamsController < ApplicationController
  before_action :set_event, :set_team, only: [:apply]

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.event = @event

    if @team.save
      redirect_to event_teams_path(@event), notice: 'Команда успешно создана.'
    else
      render :new
    end
  end

  def index
    @teams = Team.where(event_id: params[:event_id])
    render json: @teams
  end

  def apply
    # Обработка подачи заявки на участие
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :count)
  end
end
