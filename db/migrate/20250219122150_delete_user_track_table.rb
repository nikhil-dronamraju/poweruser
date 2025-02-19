class DeleteUserTrackTable < ActiveRecord::Migration[7.2]
  def change
    drop_table :user_tracks, force: :cascade
  end
end
