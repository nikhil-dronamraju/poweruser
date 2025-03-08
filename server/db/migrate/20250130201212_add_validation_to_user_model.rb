class AddValidationToUserModel < ActiveRecord::Migration[7.2]
  def change
    change_column_null :users, :username, false
    change_column_null :users, :password_digest, false
    change_column_null :users, :name, false
  end
end
