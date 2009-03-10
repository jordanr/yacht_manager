class AddOrderToDetails < ActiveRecord::Migration
  def self.up
    add_column :details, :order, :integer
  end

  def self.down
    remove_column :details, :order
  end
end
