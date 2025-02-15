class AuthController < ApplicationController
  include Authentication
  include ErrorHandling

  def sign_up
    session[:user_id] = nil
    @user = User.new
    @saga = Saga.new
  end

  def log_in
    session[:user_id] = nil
    session[:page_type] = :auth
    @user = User.new
  end

  def create_or_login_user
    @user = handle_authentication
    @errors = flash[:errors]
    if @user&.sagas&.present?
      redirect_to dashboard_home_path
    end
  end

  def tracks
  end

  def users
    @user = handle_authentication
    redirect_to dashboard_home_path if @user.present?
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :password)
  end

  def user_track_params
    params.require(:user_track)
  end
end
