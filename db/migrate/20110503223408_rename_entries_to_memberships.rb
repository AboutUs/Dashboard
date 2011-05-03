class RenameEntriesToMemberships < ActiveRecord::Migration
  def self.up
    rename_table :entries, :memberships
  end

  def self.down
    rename_table :memberships, :entries
  end
end
