class DeleteValidColumnForGroupsTable < ActiveRecord::Migration
  def self.up
    remove_column :groups, :valid
  end

  def self.down
  end
end

