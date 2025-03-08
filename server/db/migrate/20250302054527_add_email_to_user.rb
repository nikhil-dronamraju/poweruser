class AddEmailToUser < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :email, :string, null: false
  end
end
