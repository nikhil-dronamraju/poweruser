class CreateDailyTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :daily_tasks do |t|
      t.string :title
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :smart_goal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
