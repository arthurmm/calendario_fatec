class Cliente < ActiveRecord::Base
  #has_many OrdemServico

  has_many :contatos, :class_name => "Contato"
  has_many :ordem_servico
  accepts_nested_attributes_for :contatos

  validates_presence_of :nome, :message => "Campo nome obrigátorio."
  validates_length_of :nome, :minimum => 10, :message => "Campo nome deve conter no minimo de 10 caracteres"
  validates_presence_of :data_de_nascimento, :message => "Campo data de nascimento obrigatório."


  def self.search(search)
    query = []
    query << "nome like '%#{search[:nome]}%' " unless search[:nome].blank?
    query << "rg = #{search[:rg]}" unless search[:rg].blank?
    query << "ordem_servico.situacao = #{search[:situacao]}" unless search[:situacao].blank?
    query << "ordem_servico.tipo_equipamento_id = #{search[:equipamento]}" unless search[:equipamento].blank?

    find(:all, :joins => :ordem_servico, :conditions => query.join(" AND "))
  end

end

