class CreateOrdemServicos < ActiveRecord::Migration
  def self.up
    create_table :ordem_servico do |t|
      t.string :tipo_pedido
      t.string :descricao_equipamento
      t.string :descricao_defeito
      t.string :descricao_servico_realizado
      t.string :diagnostico_tecnico
      t.string :numero_serie_equipamento
      t.string :descricao_pecas
      t.decimal :valor_servico
      t.integer :cliente_id

      t.timestamps
    end
  end

  def self.down
    drop_table :ordem_servico
  end
end
