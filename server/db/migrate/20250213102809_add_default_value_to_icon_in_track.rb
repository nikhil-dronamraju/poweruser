class AddDefaultValueToIconInTrack < ActiveRecord::Migration[7.2]
  def change
    change_column :tracks, :icon, :string, default: "<i class='fa-solid fa-fire'></i>"
  end
end
