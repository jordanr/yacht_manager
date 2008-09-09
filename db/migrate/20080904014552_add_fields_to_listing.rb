class AddFieldsToListing < ActiveRecord::Migration
  def self.up
    add_column :listings, :central, :boolean
    add_column :listings, :status_id, :integer
    add_column :listings, :yacht_id, :integer
    add_column :listings, :user_id, :integer
  end

  def self.down
    remove_column :listings, :central
    remove_column :listings, :status_id
    remove_column :listings, :yacht_id
    remove_column :listings, :user_id
  end
end
