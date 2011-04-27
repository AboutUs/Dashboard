class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.integer :perspective_id
      t.string :family
      t.string :name
      t.boolean :featured
      t.boolean :hidden

      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
