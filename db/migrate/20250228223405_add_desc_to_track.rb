class AddDescToTrack < ActiveRecord::Migration[7.2]
  def change
    add_column :tracks, :desc, :text
  end
end
