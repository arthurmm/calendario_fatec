class AddTimestampInOs < ActiveRecord::Migration
  def self.up
	add_column :ordem_servico, :codigo, :string
  end

  def self.down
	remove_column :ordem_servico, :codigo
  end
end
