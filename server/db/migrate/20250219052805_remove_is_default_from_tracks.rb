class RemoveIsDefaultFromTracks < ActiveRecord::Migration[7.2]
  def change
    remove_column :tracks, :is_default, :boolean
  end
end
