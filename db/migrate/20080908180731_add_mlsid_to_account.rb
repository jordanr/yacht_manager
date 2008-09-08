class AddMlsidToAccount < ActiveRecord::Migration
  def self.up
    add_column :accounts, :multiple_listing_system_id, :integer
    add_column :accounts, :user_id, :integer
  end

  def self.down
    remove_column :accounts, :multiple_listing_system_id
    remove_column :accounts, :user_id
  end
end
