class ApplicationController < ActionController::API
  before_action :set_current_user
  def set_current_user
    @current_user ||= User.find_by_id(session[:id])
  end

  def login_user
    redirect_to login_path unless @current_user.present?
  end
end
