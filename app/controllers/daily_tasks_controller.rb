class DailyTasksController < ApplicationController
  include Authentication
  include DailyTasksHelper
  before_action :check_logged_in

  def index
    @user = User.find(session[:user_id])
    @daily_tasks = @user.daily_tasks.where(is_completed: false)
  end

  def add_task_to_box
    user = User.find(session[:user_id])
    @priority = params[:priority].to_sym
    @smart_goals = user.smart_goals
  end

  def create
    @daily_task = DailyTask.create(daily_task_params)
    @errors = format_errors(@daily_task.errors)
  end

  def destroy
    @daily_task = DailyTask.find(params[:id])
    @daily_task.destroy
  end

  def add_task
    daily_task = DailyTask.create(daily_task_params)
  end

  def complete
    @daily_task = DailyTask.find(params[:id])
    @daily_task.update(is_completed: true)
  end

  private

  def daily_task_params
    params.require(:daily_task).permit(:smart_goal_id, :title, :priority)
  end
end
