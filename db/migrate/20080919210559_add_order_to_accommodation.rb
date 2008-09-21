class AddOrderToAccommodation < ActiveRecord::Migration
  def self.up
    add_column :accommodations, :order, :integer, :default=>0
  end

  def self.down
    remove_column :accommodations, :order
  end
end
