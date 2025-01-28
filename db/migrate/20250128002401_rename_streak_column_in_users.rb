class RenameStreakColumnInUsers < ActiveRecord::Migration[7.2]
  def change
    rename_column :users, :streak, :workout_streak
  end
end
