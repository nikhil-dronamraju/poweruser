class AddContentToSaga < ActiveRecord::Migration[7.2]
  def change
    add_column :sagas, :content, :text
  end
end
