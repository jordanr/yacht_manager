class CreatePrices < ActiveRecord::Migration
  def self.up
    create_table :prices do |t|
      t.integer :currency_id, :default=>1
      t.decimal :value
      t.integer :listing_id

      t.timestamps
    end
  end

  def self.down
    drop_table :prices
  end
end
