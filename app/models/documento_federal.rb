class DocumentoFederal < ActiveRecord::Base
  belongs_to :clientes

  validates_inclusion_of :tipo_doc, :in => %w(CPF CNPJ)
  validates_presence_of :numero, :message => "CPF/CNPJ não pode ser vazio"
  validates_uniqueness_of :numero, :scope => :tipo_doc, :message => "Já existe um Cliente cadastrado com esse documento"

  Tipo = {
    'CPF' => 'CPF', 'CNPJ' => 'CNPJ'
  }
end
