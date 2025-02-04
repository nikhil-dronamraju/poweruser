class AddInfoToJournalEntry < ActiveRecord::Migration[7.2]
  def change
    add_column :journal_entries, :title, :string
    add_reference :journal_entries, :user, null: false, foreign_key: true
  end
end
