class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.datetime :time
      t.string :user
      t.string :message

      t.timestamps null: false
    end
  end
end
