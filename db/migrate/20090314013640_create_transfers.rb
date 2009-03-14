class CreateTransfers < ActiveRecord::Migration
  def self.up
    create_table :transfers do |t|
      t.integer :listing_id
      t.integer :account_id
      t.integer :user_id
      t.integer :remote_id

      t.timestamps
    end
  end

  def self.down
    drop_table :transfers
  end
end
