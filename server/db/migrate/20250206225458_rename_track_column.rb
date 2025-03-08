class RenameTrackColumn < ActiveRecord::Migration[7.2]
  def change
    rename_column :tracks, :icon_class, :icon
  end
end
