class AddNameToMultipleListingSystem < ActiveRecord::Migration
  def self.up
    add_column :multiple_listing_systems, :name, :string
  end

  def self.down
    remove_column :multiple_listing_systems, :name
  end
end
