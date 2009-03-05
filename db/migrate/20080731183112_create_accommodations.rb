class CreateDetails < ActiveRecord::Migration
  def self.up
    create_table :details do |t|
      t.string :title
      t.text :content
      t.integer :listing_id

      t.timestamps
    end
  end

  def self.down
    drop_table :details
  end
end
