class Contato < ActiveRecord::Base
  belongs_to :cliente

  validates_presence_of :valor, :message => "Valor do contato não pode ser nulo"

  validates_format_of :valor,
                  :with => /^[0-9]{6,}$/,
                  :message => "Telefone com formato inválido",
                  :if => lambda{ tipo == 1 }

  validates_format_of :valor,
                      :with => /\b[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\b/,
                      :message => "Email com formato inválido",
                      :if => lambda{ tipo == 2 }

  TIPO = {
    'Telefone' => 1, 'E-mail' => 2
  }

  def tipo_contato
    TIPO.invert[tipo]
  end

end

