class CreateUserFs < ActiveRecord::Migration
  def change
    create_table :user_fs do |t|
      t.string :email

      t.timestamps
    end
  end
end
