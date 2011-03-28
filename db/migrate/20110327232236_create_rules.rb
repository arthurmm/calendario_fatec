class CreateRules < ActiveRecord::Migration
  def self.up
    create_table :rules do |t|
      t.string :model_controller
      t.integer :action
      t.integer :role_id

      t.timestamps
    end
  end

  def self.down
    drop_table :rules
  end
end
