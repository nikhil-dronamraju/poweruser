class CreateWorkouts < ActiveRecord::Migration[7.2]
  def change
    create_table :workouts do |t|
      t.text :parts_hit

      t.timestamps
    end
  end
end
