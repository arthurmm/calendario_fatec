class AddReferenceOnClienteToDocumentoFederal < ActiveRecord::Migration
  def self.up
    change_table :clientes do |t|
      t.references :documento_federal
    end
  end

  def self.down
    remove_column :clientes, :documento_federal_id
  end
end
