class RemoveShowDataPointsFromPerspective < ActiveRecord::Migration
  def self.up
    remove_column :perspectives, :show_by_default
  end

  def self.down
    add_column :perspectives, :show_by_default, :boolean
  end
end
