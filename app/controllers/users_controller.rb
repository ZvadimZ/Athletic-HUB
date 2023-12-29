class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: user, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:user_id])
    if @user.present?
      render json: @user, status: :found
    else
      render json: @user, status: :no_content
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.id == @current_user.id
      if @user.update user_params
        render json: @user, status: :ok
      else
        render json: @user, status: :unprocessable_entity
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :photo, :birthdate)
  end
end
