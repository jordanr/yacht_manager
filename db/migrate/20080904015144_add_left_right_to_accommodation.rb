class AddLeftRightToAccommodation < ActiveRecord::Migration
  def self.up
    add_column :accommodations, :left, :text
    add_column :accommodations, :right, :text
    add_column :accommodations, :yacht_id, :integer
  end

  def self.down
    remove_column :accommodations, :right
    remove_column :accommodations, :left
    remove_column :accommodations, :yacht_id
  end
end
