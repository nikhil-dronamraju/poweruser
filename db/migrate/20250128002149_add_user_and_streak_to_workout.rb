class AddUserAndStreakToWorkout < ActiveRecord::Migration[7.2]
  def change
    add_reference :workouts, :user, null: false, foreign_key: true
    add_column :users, :streak, :integer
  end
end
