class RemoveUserFIdFromDecks < ActiveRecord::Migration
  def up
  	remove_column :decks, :user_f_id
  end

  def down
  end
end
