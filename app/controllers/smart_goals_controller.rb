class SmartGoalsController < ApplicationController
  include Authentication
  include ErrorHandling
  include SmartGoalsHelper
  include GeneralViewHelper
  before_action :check_logged_in

  def index
    @user = User.find(session[:user_id])
    @goals = @user.smart_goals
  end

  def new
    @user = User.find(session[:user_id])
    @smart_goal = SmartGoal.new
    @tracks = select_user_tracks(@user)
    @sagas = @user.sagas
  end

  def edit
    @user = User.find(session[:user_id])
    @smart_goal = SmartGoal.find(params[:id])
    @tracks = select_user_tracks(@user)
    @sagas = @user.sagas
  end

  def update
    @smart_goal = SmartGoal.find(params[:id])
    @smart_goal.update(goal_params)
  end

  def create
    smart_goal = SmartGoal.new(goal_params)
    smart_goal.user = User.find(session[:user_id])
    smart_goal.save
    @errors = format_errors(smart_goal.errors)
  end

  def destroy
    @smart_goal = SmartGoal.find(params[:id])
    @smart_goal.destroy
  end

  private

  def goal_params
    params.require(:smart_goal).permit(:user_track_id, :saga_id, :user_id, :start_date, :end_date, :measurable_goal)
  end
end
