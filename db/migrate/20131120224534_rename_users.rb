class RenameUsers < ActiveRecord::Migration
def self.up
    rename_column :restaurants, :owner_id, :user_id
    rename_table :owners, :users
  end

  def self.down
    rename_column :restaurants, :user_id, :owner_id
    rename_table :users, :owners
  end
end
