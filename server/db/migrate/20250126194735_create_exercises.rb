class CreateExercises < ActiveRecord::Migration[7.2]
  def change
    create_table :exercises do |t|
      t.text :title
      t.text :desc
      t.text :type
      t.text :equipment
      t.text :level
      t.text :rating
      t.text :rating_desc

      t.timestamps
    end
  end
end
