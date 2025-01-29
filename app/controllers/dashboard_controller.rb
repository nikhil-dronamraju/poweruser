class DashboardController < ApplicationController
  include Authentication
  before_action :check_login
  def home
    session[:page_type] = "Dashboard"
    @user = User.find(session[:user_id])
  end
end
