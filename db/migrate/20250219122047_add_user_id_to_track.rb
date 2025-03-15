class AddUserIdToTrack < ActiveRecord::Migration[7.2]
  def change
    add_reference :tracks, :user, null: false, foreign_key: true, default: User.first.id
  end
end
