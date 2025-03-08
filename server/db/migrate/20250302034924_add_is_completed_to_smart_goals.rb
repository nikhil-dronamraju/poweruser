class AddIsCompletedToSmartGoals < ActiveRecord::Migration[7.2]
  def change
    add_column :smart_goals, :is_completed, :boolean, default: false
  end
end
