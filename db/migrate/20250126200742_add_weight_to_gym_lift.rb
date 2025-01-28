class AddWeightToGymLift < ActiveRecord::Migration[7.2]
  def change
    add_column :gym_lifts, :weight, :integer
  end
end
