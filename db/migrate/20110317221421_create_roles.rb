class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :name
      t.integer :value
      t.integer :group_id

      t.timestamps
    end
  end

  def self.down
    drop_table :roles
  end
end

