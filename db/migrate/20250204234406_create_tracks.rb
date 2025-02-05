class CreateTracks < ActiveRecord::Migration[7.2]
  def change
    create_table :tracks do |t|
      t.string :title
      t.string :icon_class

      t.timestamps
    end
  end
end
