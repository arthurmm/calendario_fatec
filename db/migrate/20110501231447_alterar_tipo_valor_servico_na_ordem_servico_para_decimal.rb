class AlterarTipoValorServicoNaOrdemServicoParaDecimal < ActiveRecord::Migration
  def self.up
    change_column :ordem_servico, :valor_servico, :decimal, :precision => 8, :scale => 2
  end

  def self.down
    change_column :ordem_servico, :valor_servico, :integer
  end
end
