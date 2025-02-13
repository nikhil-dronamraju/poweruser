class RemoveMoreUnneededColumnsFromTables < ActiveRecord::Migration[7.2]
  def change
    remove_index :smart_goals, :user_id
    remove_column :smart_goals, :user_id
  end
end
