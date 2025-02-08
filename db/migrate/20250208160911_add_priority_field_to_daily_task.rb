class AddPriorityFieldToDailyTask < ActiveRecord::Migration[7.2]
  def change
    add_column :daily_tasks, :priority, :integer
  end
end
