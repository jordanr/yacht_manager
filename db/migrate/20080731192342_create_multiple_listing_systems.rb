class CreateMultipleListingSystems < ActiveRecord::Migration
  def self.up
    create_table :multiple_listing_systems do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :multiple_listing_systems
  end
end
