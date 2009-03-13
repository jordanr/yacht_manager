class AddBrokerToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :broker, :boolean
  end

  def self.down
    remove_column :users, :broker
  end
end
