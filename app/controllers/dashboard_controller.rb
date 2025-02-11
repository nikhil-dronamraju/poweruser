class DashboardController < ApplicationController
  include Authentication
  include ErrorHandling
  include DashboardHelper
  include GeneralViewHelper
  before_action :check_logged_in, :check_onboarded
  def home
    session[:page_type] = "Dashboard"
    @user = User.find(session[:user_id])
    @tasks = @user.daily_tasks
    @smart_goals = @user.smart_goals
    @saga = @user.sagas.last
  end

  def saga
    @saga = Saga.find(params[:id])
  end
end
