class CreateDocumentoFederals < ActiveRecord::Migration
  def self.up
    create_table :documento_federals do |t|
      t.column :tipo_doc, :string
      t.column :numero, :string
      t.references :cliente

      t.timestamps
    end
  end

  def self.down
    drop_table :documento_federals
  end
end
