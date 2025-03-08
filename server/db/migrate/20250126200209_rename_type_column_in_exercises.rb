class RenameTypeColumnInExercises < ActiveRecord::Migration[7.2]
  def change
    rename_column :exercises, :type, :exercise_type
  end
end
