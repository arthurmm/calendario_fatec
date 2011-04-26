class Contato < ActiveRecord::Base
  belongs_to :cliente

  validates_presence_of :valor, :message => "Valor do contato não pode ser nulo"
end

