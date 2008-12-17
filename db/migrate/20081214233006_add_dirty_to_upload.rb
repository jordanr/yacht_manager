class AddDirtyToUpload < ActiveRecord::Migration
  def self.up
    add_column :uploads, :dirty, :boolean, :default=>true
  end

  def self.down
    remove_column :uploads, :dirty
  end
end
