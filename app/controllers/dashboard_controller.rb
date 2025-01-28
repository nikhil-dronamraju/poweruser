class DashboardController < ApplicationController
  include Authentication
  before_action :check_login
  def home
    session[:page_type] = "Dashboard"
    @user = User.find(session[:user_id])
  end

  def fitness_tracking
    @user = User.find(session[:user_id])
    @last_two_weeks = (Date.today - 14..Date.today).to_a
  end

  def add_lift_to_workout
    @exercise = Exercise.find_by(title: params[:lift])
    @reps = params[:reps].to_i
    @sets = params[:reps].to_i
    respond_to do |format|
      format.html { fitness_tracking_path }
      format.turbo_stream
    end
  end
end
