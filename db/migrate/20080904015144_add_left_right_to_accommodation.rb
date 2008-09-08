class AddLeftRightToAccommodation < ActiveRecord::Migration
  def self.up
    add_column :accommodations, :left, :text
    add_column :accommodations, :right, :text
  end

  def self.down
    remove_column :accommodations, :right
    remove_column :accommodations, :left
  end
end
