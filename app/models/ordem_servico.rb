class OrdemServico < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :tipo_equipamento
end

