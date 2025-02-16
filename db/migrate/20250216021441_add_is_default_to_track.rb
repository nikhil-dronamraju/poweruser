class AddIsDefaultToTrack < ActiveRecord::Migration[7.2]
  def change
    add_column :tracks, :is_default, :boolean, default: false
  end
end
