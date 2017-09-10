class AddIndexOnUserToMessage < ActiveRecord::Migration
  def change
    add_index :messages, :user, unique: false
  end
end
