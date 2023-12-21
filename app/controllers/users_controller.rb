class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      # Запись пользователя в команду
      team = Team.find(params[:team_id])
      team.users << user

      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
