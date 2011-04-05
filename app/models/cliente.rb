class Cliente < ActiveRecord::Base
  has_many OrdemServico
  has_many Contato

  validates_presence_of :nome
  validates_presence_of :data_de_nascimento

end

