class CreateWidgets < ActiveRecord::Migration
  def self.up
    create_table :widgets do |t|
      t.integer :user_id
      t.string :url
      t.integer :height
      t.integer :width

      t.timestamps
    end
  end

  def self.down
    drop_table :widgets
  end
end
