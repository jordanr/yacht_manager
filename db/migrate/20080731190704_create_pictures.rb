class CreatePictures < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|
      t.string :description
      t.string :content_type
      t.string :filename
      t.binary :binary_data

      t.timestamps
    end
  end

  def self.down
    drop_table :pictures
  end
end
