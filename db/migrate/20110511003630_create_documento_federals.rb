class CreateDocumentoFederals < ActiveRecord::Migration
  def self.up
    create_table :documento_federals do |t|
      t.column :tipo_doc, :enum, :limit => [ :CPF, :CNPJ ]
      t.column :numero, :int, :limit => 8

      t.timestamps
    end
  end

  def self.down
    drop_table :documento_federals
  end
end
