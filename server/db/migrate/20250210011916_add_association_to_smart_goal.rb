class AddAssociationToSmartGoal < ActiveRecord::Migration[7.2]
  def change
    add_reference :smart_goals, :saga, null: false, foreign_key: true
  end
end
