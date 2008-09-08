class CreateYachts < ActiveRecord::Migration
  def self.up
    create_table :yachts do |t|
      t.integer :specification_id
      t.string :name
      t.boolean :new
      t.integer :location_id

      t.timestamps
    end
  end

  def self.down
    drop_table :yachts
  end
end
