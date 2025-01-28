class DashboardController < ApplicationController
  include Authentication
  before_action :check_login
  def home
    session[:page_type] = "Dashboard"
    @user = User.find(session[:user_id])
  end

  def fitness_tracking
    @user = User.find(session[:user_id])

  end

  def new_workout
    @workout = Workout.new(gym_lifts: [GymLift.new])
    @last_two_weeks = (Date.today - 14..Date.today).to_a
    @workout_types = Workout.workout_types.to_a
  end

  def create_workout

  end

  def add_lift_to_workout
    # @all_lifts = Exercise.all.select(:title).map(&:title).to_a.sort
  end

  def delete_lift_from_workout

  end
end
