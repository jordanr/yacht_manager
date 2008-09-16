class AddYachtIdToPicture < ActiveRecord::Migration
  def self.up
    add_column :pictures, :yacht_id, :integer
  end

  def self.down
    remove_column :pictures, :yacht_id
  end
end
