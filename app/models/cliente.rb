class Cliente < ActiveRecord::Base
  #has_many OrdemServico

  has_many :contatos, :class_name => "Contato"
  has_many :ordem_servico
  accepts_nested_attributes_for :contatos

  validates_presence_of :nome, :message => "Campo nome obrigátorio."
  validates_length_of :nome, :minimum => 10, :message => "Campo nome deve conter no minimo de 10 caracteres"
  validates_presence_of :data_de_nascimento, :message => "Campo data de nascimento obrigatório."


end

class Lead < Cliente

end

class ClienteFinal < Cliente

end

