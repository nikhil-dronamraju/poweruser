class CreateGymLifts < ActiveRecord::Migration[7.2]
  def change
    create_table :gym_lifts do |t|
      t.references :exercise, null: false, foreign_key: true
      t.integer :sets
      t.integer :reps

      t.timestamps
    end
  end
end
