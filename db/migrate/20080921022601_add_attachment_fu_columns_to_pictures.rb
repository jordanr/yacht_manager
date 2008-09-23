class AddAttachmentFuColumnsToPictures < ActiveRecord::Migration
  def self.up
    add_column :pictures, :parent_id, :integer
    add_column :pictures, :thumbnail, :string
    add_column :pictures, :size, :integer
    add_column :pictures, :width, :integer
    add_column :pictures, :height, :integer
    remove_column :pictures, :binary_data
  end

  def self.down
    remove_column :pictures, :height
    remove_column :pictures, :width
    remove_column :pictures, :size
    remove_column :pictures, :thumbnail
    remove_column :pictures, :parent_id
    add_column :pictures, :binary_data, :binary
  end
end
