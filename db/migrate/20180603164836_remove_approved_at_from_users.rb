class RemoveApprovedAtFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :approved_at, :timestamp
  end
end
