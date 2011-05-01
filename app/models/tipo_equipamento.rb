class TipoEquipamento < ActiveRecord::Base
  has_many :ordem_servico
end

