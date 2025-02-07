class CreateSmartGoals < ActiveRecord::Migration[7.2]
  def change
    create_table :smart_goals do |t|
      t.belongs_to :user_track, null: false, foreign_key: true
      t.string :measurable_goal
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
