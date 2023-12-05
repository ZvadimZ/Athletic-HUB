class TeamsController < ApplicationController
  before_action :set_event, :set_team, only: [:apply]

  def index
    @teams = Team.where(event_id: params[:event_id])
    if @teams.present?
      render json: @teams, include: 'users', status: :ok
    else
      render json: @teams, status: 204
    end
  end

  def apply
    if @team.capacity < @team.max_count
      @team.capacity += 1
      TeamMember.create(user_id: @current_user.id, team_id:@team.id)

      @teams = Team.where(event_id: params[:event_id])
      render json: @teams, include: 'users', status: :ok
    else
      @teams = Team.where(event_id: params[:event_id])
      render json: @teams, include: 'users', status: 423
    end

  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :capacity)
  end
end
