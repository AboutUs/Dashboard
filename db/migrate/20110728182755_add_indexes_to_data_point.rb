class AddIndexesToDataPoint < ActiveRecord::Migration
  def self.up
    add_index(:data_points, [:name])
    add_index(:data_points, [:value_num])
    add_index(:data_points, [:value_str])
    add_index(:data_points, [:recorded_at])
  end

  def self.down
  end
end
