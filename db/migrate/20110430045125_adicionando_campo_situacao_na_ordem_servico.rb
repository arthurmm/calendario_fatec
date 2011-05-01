class AdicionandoCampoSituacaoNaOrdemServico < ActiveRecord::Migration
  def self.up
    add_column :ordem_servico, :situacao, :string 
  end

  def self.down
  end
end
