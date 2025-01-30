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
    log_user_in(params[:user])
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :password)
  end
end
