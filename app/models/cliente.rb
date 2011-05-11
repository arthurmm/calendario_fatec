class Cliente < ActiveRecord::Base
  #has_many OrdemServico

  has_one :documento_federal
  has_many :contatos, :class_name => "Contato"
  has_many :ordem_servico
  accepts_nested_attributes_for :contatos
  accepts_nested_attributes_for :documento_federal

  validates_presence_of :nome, :message => "Campo nome obrigátorio."
  validates_presence_of :rg, :message => "Campo RG é orbigatório."
  validates_length_of :nome, :minimum => 10, :message => "Campo nome deve conter no minimo de 10 caracteres"
  validates_presence_of :data_de_nascimento, :message => "Campo data de nascimento obrigatório."


  def self.search(search)
    query = []
    query << "nome like '%#{search[:nome]}%' " unless search[:nome].blank?
    query << "rg = #{search[:rg]}" unless search[:rg].blank?
    query << "ordem_servico.situacao = #{search[:situacao]}" unless search[:situacao].blank?
    query << "ordem_servico.tipo_equipamento_id = #{search[:equipamento]}" unless search[:equipamento].blank?

    find(:all,
        :joins => 'LEFT JOIN ordem_servico on ordem_servico.cliente_id = clientes.id',
        :conditions => query.join(" AND "))
  end

  def self.has_os
    find(:all, :joins => :ordem_servico, :conditions=> {:ordem_servico => {:situacao =>[1,2,3,4]}}).uniq
  end
end

