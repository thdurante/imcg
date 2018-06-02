class AddExtraAttributesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :approved_at, :timestamp, default: nil

    add_index :users, :username, unique: true
  end
end
