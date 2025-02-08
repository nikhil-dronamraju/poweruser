class DailyTasksController < ApplicationController
  include Authentication
  before_action :check_logged_in

  def index
    @user = User.find(session[:user_id])
    @tasks = @user.daily_tasks
  end

  def new
    @user = User.find(session[:user_id])
    @tasks = @user.daily_tasks
    @daily_task = DailyTask.new
    @smart_goals = @user.smart_goals
  end

  def create
    DailyTask.create(daily_task_params)
  end

  def add_task
    daily_task = DailyTask.create(daily_task_params)
  end

  private

  def daily_task_params
    params.require(:daily_task).permit(:user_id, :title, :smart_goal_id)
  end
end
