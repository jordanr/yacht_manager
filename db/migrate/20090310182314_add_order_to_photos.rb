class AddOrderToPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :order, :integer
  end

  def self.down
    remove_column :photos, :order
  end
end
