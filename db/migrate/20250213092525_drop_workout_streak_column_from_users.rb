class DropWorkoutStreakColumnFromUsers < ActiveRecord::Migration[7.2]
  def change
    remove_column :users, :workout_streak, :integer
  end
end
