class CreateSagas < ActiveRecord::Migration[7.2]
  def change
    create_table :sagas do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :title
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
