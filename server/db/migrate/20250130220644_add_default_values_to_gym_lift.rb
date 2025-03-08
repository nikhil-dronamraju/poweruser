class AddDefaultValuesToGymLift < ActiveRecord::Migration[7.2]
  def change
    change_column :gym_lifts, :weight, :integer, default: 1
    change_column :gym_lifts, :reps, :integer, default: 1
    change_column :gym_lifts, :sets, :integer, default: 1
  end
end
