class AddColumnsTipoInTableContato < ActiveRecord::Migration
  def self.up
    add_column :contatos, :tipo, :integer
  end

  def self.down
    move_column :contatos, :tipo
  end
end

