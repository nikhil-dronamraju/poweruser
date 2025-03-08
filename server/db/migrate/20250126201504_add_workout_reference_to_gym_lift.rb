class AddWorkoutReferenceToGymLift < ActiveRecord::Migration[7.2]
  def change
    add_reference :gym_lifts, :workout, null: false, foreign_key: true
  end
end
