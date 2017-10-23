class RenameUserToUsernameOnMessages < ActiveRecord::Migration
  def change
    rename_column :messages, :user, :user_name
  end
end
