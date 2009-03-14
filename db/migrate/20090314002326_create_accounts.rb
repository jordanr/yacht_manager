class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :login
      t.string :crypted_password
      t.string :salt
      t.integer :mls_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
