class AddTrackIdToDailyTask < ActiveRecord::Migration[7.2]
  def change
    add_reference :daily_tasks, :track, null: false, foreign_key: true, default: Track.first.id
  end
end
