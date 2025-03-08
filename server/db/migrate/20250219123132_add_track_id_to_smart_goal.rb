class AddTrackIdToSmartGoal < ActiveRecord::Migration[7.2]
  def change
    add_reference :smart_goals, :track, null: false, foreign_key: true
  end
end
