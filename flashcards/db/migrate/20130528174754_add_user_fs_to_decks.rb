class AddUserFsToDecks < ActiveRecord::Migration
  def change
  	add_column :decks, :user_f_id, :integer
  	add_index :decks, :user_f_id
  end
end
