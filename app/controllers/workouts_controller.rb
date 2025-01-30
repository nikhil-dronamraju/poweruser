class WorkoutsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
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

  def edit; end
  def create
    @user = User.find(session[:user_id])
    workout = Workout.new(workout_type: Workout.workout_types[params[:workout][:workout_type]], user: @user)
    params[:workout][:gym_lifts_attributes].each do |attribute|
      p attribute[1]
      exercise_id = attribute[1][:exercise_id]
      reps = attribute[1][:reps]
      weight = attribute[1][:weight]
      sets = attribute[1][:sets]
      gym_lift = GymLift.create(exercise_id: exercise_id, workout: workout, reps: reps, sets: sets, weight: weight)
    end
    workout.save!
  end
  def show; end
  def update; end
  def destroy; end
end
