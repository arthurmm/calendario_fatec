class Cliente < ActiveRecord::Base
  #has_many OrdemServico
  #has_many Contato

  validates_presence_of :nome, :message => "Campo nome obrigátorio."
  validates_length_of :nome, :minimum => 10, :message => "Campo nome deve conter no minimo de 10 caracteres"
  validates_presence_of :data_de_nascimento, :message => "Campo data de nascimento obrigatório."
#  validates_format_of :data_de_nascimento,    => %r{(\d{2})\\(\d{2})\\(\d{4})}i,  => "Data de nascimento em formato inválido"



end

