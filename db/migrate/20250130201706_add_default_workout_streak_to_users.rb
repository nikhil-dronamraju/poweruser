class AddDefaultWorkoutStreakToUsers < ActiveRecord::Migration[7.2]
  def change
    change_column :users, :workout_streak, :integer, default: 0
  end
end
