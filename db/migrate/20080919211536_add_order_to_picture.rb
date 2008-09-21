class AddOrderToPicture < ActiveRecord::Migration
  def self.up
    add_column :pictures, :order, :integer, :default=>0
  end

  def self.down
    remove_column :pictures, :order
  end
end
