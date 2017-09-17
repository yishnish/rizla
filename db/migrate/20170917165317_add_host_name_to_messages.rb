class AddHostNameToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :host, :string
  end
end
