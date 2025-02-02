class WorkoutsController < ApplicationController
  include Authentication
  before_action :check_logged_in
  def index
    @user = User.find(session[:user_id])
    @workout = @user.workouts&.last
  end

  def new
    @workout = Workout.new
    @workout.gym_lifts.build
    @last_two_weeks = (Date.today - 14..Date.today).to_a
    @workout_types = Workout.workout_types
    @all_exercises = Exercise.all.select(:id, :title).order("title ASC")
  end

  def add_lift_form
    @frame_id = DateTime.now
    @all_exercises = Exercise.all.select(:id, :title).order("title ASC")
    @workout = Workout.new
    @gym_lift = GymLift.new
  end

  def delete_lift_form
    @frame_id = params[:frame_id]
  end

  def edit
    @workout = Workout.find(params[:id])
    @user = User.find(session[:user_id])
    @last_two_weeks = (Date.today - 14..Date.today).to_a
    @workout_types = Workout.workout_types
    @all_exercises = Exercise.all.select(:id, :title).order("title ASC")
  end
  def create
    workout = Workout.new(workout_params)
    workout.user_id = session[:user_id]
    workout.save!
  rescue
    messages = workout.errors.full_messages
    render turbo_stream: turbo_stream.replace("err_messages", partial: "error_messages", locals: { messages: messages })
  end
  def list
    @user = User.find(session[:user_id])
    @workouts = @user.workouts.all
  end
  def update
    @workout = Workout.find(params[:id])
    @workout.update(workout_params)
  rescue
    messages = workout.errors.full_messages
    render turbo_stream: turbo_stream.replace("err_messages", partial: "error_messages", locals: { messages: messages })
  end
  def destroy
    @user = User.find(session[:user_id])
    @workout = Workout.find(params[:id])
    @workout.destroy
  end

  private

  def workout_params
    params.require(:workout).permit([ :created_at, :workout_type, gym_lifts_attributes: [ :id, :exercise_id, :reps, :sets, :weight ] ] )
  end
end
