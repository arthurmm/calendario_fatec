class OrdemServico < ActiveRecord::Base
  belongs_to :cliente
  has_one :tipo_equipamento
end

