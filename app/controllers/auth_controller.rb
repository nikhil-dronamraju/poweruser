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
    user = User.find_by(username: params[:user][:username])
    if user.present?
      log_user_in(params[:user])
    else
      user = User.create(username: params[:user][:username], password: params[:user][:password], name: params[:user][:name])
      session[:user_id] = user.id
      redirect_to dashboard_home_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :password)
  end
end
