class SmartGoalsController < ApplicationController
  include Authentication
  include ErrorHandling
  include SmartGoalsHelper
  include GeneralViewHelper
  before_action :check_logged_in

  def index
    session[:page_type] = "smart_goals"
    @user = User.find(session[:user_id])
    @goals = @user.smart_goals.where(is_completed: false)
    @smart_goal = SmartGoal.new
  end

  def new
    @user = User.find(session[:user_id])
    @smart_goal = SmartGoal.new
    @tracks = @user.tracks
    @sagas = @user.sagas
  end

  def edit
    @user = User.find(session[:user_id])
    @smart_goal = SmartGoal.find(params[:id])
    @tracks = @user.tracks
    @sagas = @user.sagas
  end

  def update
    @smart_goal = SmartGoal.find(params[:id])
    @smart_goal.update(goal_params)
    redirect_to smart_goals_path
  end

  def create
    @user = User.find(session[:user_id])
    @smart_goal = SmartGoal.new(goal_params)
    @smart_goal.save
    @errors = format_errors(@smart_goal.errors)
  end

  def destroy
    @user = User.find(session[:user_id])
    @smart_goals = @user.smart_goals
    @smart_goal = SmartGoal.find(params[:id])
    @smart_goal.destroy
  end

  def complete
    @smart_goal = SmartGoal.find(params[:id])
    @smart_goal.update(is_completed: true)
  end

  private

  def goal_params
    params.require(:smart_goal).permit(:track_id, :saga_id, :user_id, :start_date, :end_date, :measurable_goal)
  end
end
