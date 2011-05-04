class AddEnderecoAoCliente < ActiveRecord::Migration
  def self.up
      add_column :clientes, :cep, :string
      add_column :clientes, :logradouro, :string
      add_column :clientes, :nr_logradouro, :string
      add_column :clientes, :cidade, :string
      add_column :clientes, :estado, :string
      add_column :clientes, :complemento, :string
      add_column :clientes, :bairro, :string
  end

  def self.down
    remove_columns(:clientes, :cep, :logradouro, :nr_logradouro, :cidade, :estado, :complemento, :bairro)
  end
end
