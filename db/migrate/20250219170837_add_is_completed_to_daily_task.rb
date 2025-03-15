class AddIsCompletedToDailyTask < ActiveRecord::Migration[7.2]
  def change
    add_column :daily_tasks, :is_completed, :boolean, default: false
  end
end
