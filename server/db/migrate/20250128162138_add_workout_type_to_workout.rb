class AddWorkoutTypeToWorkout < ActiveRecord::Migration[7.2]
  def change
    add_column :workouts, :workout_type, :integer, default: 0
  end
end
