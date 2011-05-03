class CreateHistoricos < ActiveRecord::Migration
  def self.up
    create_table :historicos do |t|
      t.string :descricao
      t.integer :ordem_servico_id
      t.integer :situacao

      t.timestamps
    end
  end

  def self.down
    drop_table :historicos
  end
end
