class BelongsToWithUserAndeGroup < ActiveRecord::Migration
  def self.up
    add_column :users , :group_id, :integer
  end

  def self.down
  end
end

