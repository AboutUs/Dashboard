class CreateDataPoints < ActiveRecord::Migration
  def self.up
    create_table :data_points do |t|
      t.string :family
      t.string :name
      t.integer :value_num
      t.string :value_str
      t.datetime :recorded_at

      t.timestamps
    end
  end

  def self.down
    drop_table :data_points
  end
end
