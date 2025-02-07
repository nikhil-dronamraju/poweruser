class DashboardController < ApplicationController
  include Authentication
  include DashboardHelper
  before_action :check_logged_in, :check_onboarded
  def home
    session[:page_type] = "Dashboard"
    @user = User.find(session[:user_id])
  end

  def new_goal
    @user = User.find(session[:user_id])
    @smart_goal = SmartGoal.new
    @tracks = select_user_tracks(@user)
  end

  def create_goal
    smart_goal = SmartGoal.new(goal_params)
    smart_goal.user = User.find(session[:user_id])
    smart_goal.save!
  end

  def pomodoro ; end

  private

  def goal_params
    params.require(:smart_goal).permit(:user_track_id, :user_id, :start_date, :end_date, :measurable_goal)
  end
end
