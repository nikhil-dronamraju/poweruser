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
    @priority = daily_task_params[:priority]
  end

  def destroy
    @user = User.find(session[:user_id])
    @priority = params[:priority]
    @daily_task = DailyTask.find(params[:id])
    @daily_task.destroy
    @daily_tasks = @user.daily_tasks.where(is_completed: false, priority: DailyTask.priorities[@priority.to_sym])
  end

  def add_task
    daily_task = DailyTask.create(daily_task_params)
  end

  def complete
    user = User.find(session[:user_id])
    @daily_task = DailyTask.find(params[:id])
    @daily_task.update(is_completed: true)
    @priority = params[:priority]
    @daily_tasks = user.daily_tasks.where(is_completed: false, priority: DailyTask.priorities[@priority.to_sym])
  end

  private

  def daily_task_params
    params.require(:daily_task).permit(:smart_goal_id, :title, :priority)
  end
end
