class AddHashedIdToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :hashed_id, :string
  end
end
