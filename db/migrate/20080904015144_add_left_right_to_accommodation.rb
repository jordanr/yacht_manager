class AddLeftRightToAccommodation < ActiveRecord::Migration
  def self.up
    add_column :accommodations, :left, :string
    add_column :accommodations, :right, :string
  end

  def self.down
    remove_column :accommodations, :right
    remove_column :accommodations, :left
  end
end
