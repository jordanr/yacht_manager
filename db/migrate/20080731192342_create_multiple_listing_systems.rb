class CreateMultipleListingSystems < ActiveRecord::Migration
  def self.up
    create_table :multiple_listing_systems do |t|
      t.column :name, :string
      t.timestamps
    end

    MultipleListingSystem.create :name => "Yacht World" 
    MultipleListingSystem.create :name => "Yacht Council" 
  end

  def self.down
    drop_table :multiple_listing_systems
  end
end
