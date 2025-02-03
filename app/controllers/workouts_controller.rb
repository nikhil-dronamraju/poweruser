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
    @all_exercises = Exercise.all.select(:id, :title).order("title ASC")
    @frame_id = SecureRandom.uuid
  end
  def delete_lift_form
    @frame_id = params[:frame_id]
    @workout = Workout.find_by(id: params[:workout_id])
    @gym_lift = GymLift.find_by(id: @frame_id)
    if @workout.present?
      if @workout.gym_lifts.count > 1
        @gym_lift.destroy
        render turbo_stream: turbo_stream.remove(@frame_id)
      else
        render turbo_stream: turbo_stream.replace("err_messages", partial: "error_messages", locals: { messages: [ "ERROR: A workout must have at least one lift" ] })
      end
    else
      render turbo_stream: turbo_stream.remove(@frame_id)
    end
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
    if workout.errors.any?
      render turbo_stream: turbo_stream.replace("err_messages", partial: "error_messages", locals: { messages: workout.errors.full_messages })
    end
    workout.save!
  rescue
    render turbo_stream: turbo_stream.replace("err_messages", partial: "error_messages", locals: { messages: [ "There's been an error. Please try again." ] })
  end
  def list
    @user = User.find(session[:user_id])
    @workouts = @user.workouts.all
  end
  def update
    @workout = Workout.find(params[:id])
    @workout.update(workout_params)
    if @workout.errors.any?
      render turbo_stream: turbo_stream.replace("err_messages", partial: "error_messages", locals: { messages: @workout.errors.full_messages })
    end
  # rescue
  #   render turbo_stream: turbo_stream.replace("err_messages", partial: "error_messages", locals: { messages: [ "There's been an error. Please try again." ] })
  end
  def destroy
    @user = User.find(session[:user_id])
    @workout = Workout.find(params[:id])
    @workout.destroy
  end

  def add_lift_to_workout
    @workout = Workout.find(params[:id])
    @all_exercises = Exercise.all.select(:id, :title).order("title ASC")
    gym_lift = GymLift.create(workout: @workout, exercise: Exercise.first)
    if gym_lift.errors.any?
      render turbo_stream: turbo_stream.replace("err_messages", partial: "err_messages", locals: { messages: gym_lift.errors.full_messages })
    end
    @frame_id = gym_lift.id
  rescue
    render turbo_stream: turbo_stream.replace("err_messages", partial: "err_messages", locals: { messages: [ "There's been an error." ] })
  end

  private

  def workout_params
    params.require(:workout).permit([ :created_at, :workout_type, gym_lifts_attributes: [ :id, :exercise_id, :reps, :sets, :weight ] ])
  end
end
