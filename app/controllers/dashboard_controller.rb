class DashboardController < ApplicationController
  include Authentication
  before_action :check_logged_in, :check_onboarded
  def home
    session[:page_type] = "Dashboard"
    @user = User.find(session[:user_id])
  end

  def pomodoro ; end
end
