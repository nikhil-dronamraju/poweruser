class AuthController < ApplicationController
  include Authentication

  def sign_up
    session[:user_id] = nil
    session[:page_type] = :auth
    @user = User.new
  end

  def log_in
    session[:user_id] = nil
    session[:page_type] = :auth
    @user = User.new
  end

  def create_or_login_user
    @user = handle_authentication
    if @user&.sagas&.present?
      redirect_to dashboard_home_path
    end
  end

  def create_saga

  end

  def create_user_track
    p user_track_params
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :password)
  end

  def user_track_params
    params.require(:user_track)
  end
end
