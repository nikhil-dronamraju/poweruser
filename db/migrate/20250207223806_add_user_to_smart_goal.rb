class AddUserToSmartGoal < ActiveRecord::Migration[7.2]
  def change
    add_reference :smart_goals, :user, null: false, foreign_key: true
  end
end
