class CreateSpecificationClasses < ActiveRecord::Migration
  def self.up
    create_table :specification_classes do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :specification_classes
  end
end
