class WorkoutsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
  end

  def new
    @workout = Workout.new(gym_lifts: [GymLift.new])
    @last_two_weeks = (Date.today - 14..Date.today).to_a
    @workout_types = Workout.workout_types
    # @all_exercises = Exercise.all.select(:title).to_a.map(&:title).sort
  end

  def add_lift_form
    @frame_id = DateTime.now
    @all_exercises = Exercise.all.select(:title).to_a.map(&:title).sort
  end

  def delete_lift_form
    @frame_id = params[:frame_id]
  end

  def edit; end
  def create; end
  def show; end
  def update; end
  def destroy; end
end
