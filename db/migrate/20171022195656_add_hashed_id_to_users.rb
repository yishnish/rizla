class AddHashedIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :hashed_id, :string
  end
end
