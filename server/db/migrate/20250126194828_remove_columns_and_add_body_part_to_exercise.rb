class RemoveColumnsAndAddBodyPartToExercise < ActiveRecord::Migration[7.2]
  def change
    remove_column :exercises, :created_at
    remove_column :exercises, :updated_at
    add_column :exercises, :body_part, :text
  end
end
