class Historico < ActiveRecord::Base
	belongs_to :ordem_servico
  validates_presence_of :descricao, :message => "Campo de descrição da situação obrigatorio."
end
