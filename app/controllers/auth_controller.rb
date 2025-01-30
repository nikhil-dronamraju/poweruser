class AuthController < ApplicationController
  include Authentication
  def sign_up
    session[:user_id] = nil
    @user = User.new
  end

  def log_in ; end

  def create_or_login_user
    log_in(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :password)
  end
end
