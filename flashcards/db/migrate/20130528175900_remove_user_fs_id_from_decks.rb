class RemoveUserFsIdFromDecks < ActiveRecord::Migration
  def up
  	remove_column :decks, :user_fs_id
  end

  def down
  end
end
