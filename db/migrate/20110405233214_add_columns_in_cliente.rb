class AddColumnsInCliente < ActiveRecord::Migration
  def self.up
      add_column :clientes, :cpf, :string
      add_column :clientes, :nome_conhecido, :string
      add_column :clientes, :sexo, :char, :limit => 1
      add_column :clientes, :tipo, :char, :limit => 1
  end

  def self.down
    remove_column :clientes, :cpf
    remove_column :clientes, :nome_conhecido
    remove_column :clientes, :sexo
    remove_column :clientes, :tipo
  end
end

