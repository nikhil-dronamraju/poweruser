class AddStartDateAndEndDateToTrack < ActiveRecord::Migration[7.2]
  def change
    add_column :tracks, :start_date, :datetime
    add_column :tracks, :end_date, :datetime
  end
end
