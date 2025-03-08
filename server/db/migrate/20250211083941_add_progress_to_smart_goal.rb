class AddProgressToSmartGoal < ActiveRecord::Migration[7.2]
  def change
    add_column :smart_goals, :progress, :integer, default: 0
  end
end
