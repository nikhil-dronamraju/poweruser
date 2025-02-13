class RemoveUnneededColumnsFromTables < ActiveRecord::Migration[7.2]
  def change
    remove_index :daily_tasks, :user_id
    remove_column :daily_tasks, :user_id
    remove_index :daily_tasks, :track_id
    remove_column :daily_tasks, :track_id
  end
end
