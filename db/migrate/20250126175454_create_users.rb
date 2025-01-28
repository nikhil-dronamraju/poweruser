class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.text :name
      t.text :username
      t.text :password_digest

      t.timestamps
    end
  end
end
