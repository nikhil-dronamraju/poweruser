class RemoveUserTrackIdFromSmartGoal < ActiveRecord::Migration[7.2]
  def change
    remove_column :smart_goals, :user_track_id, force: :cascade
  end
end
