class AddIndicesToDataPoints < ActiveRecord::Migration
  def self.up
    add_index(:data_points, [:family, :name])
  end

  def self.down
    # Haha, disregard that!
  end
end
