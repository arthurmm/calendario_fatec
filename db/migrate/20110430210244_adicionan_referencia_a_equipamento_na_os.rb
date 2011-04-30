class AdicionanReferenciaAEquipamentoNaOs < ActiveRecord::Migration
  def self.up

     change_table :ordem_servico do |t|
      t.references :tipo_equipamento
    end
  end

  def self.down
  end
end

