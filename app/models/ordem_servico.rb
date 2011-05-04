class OrdemServico < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :tipo_equipamento
	has_many :historicos
  accepts_nested_attributes_for :historicos

	after_save { |record| enviar_email(record) }
  
  validates_presence_of :descricao_defeito, :message => "Campo de descrição do defeito é obrigatorio."

  TipoPedido = [ 'Orçamento', 'Ordem de Serviço' ]

  Situacao = {
    "Em orçamento" => 1,
    "Aguardando aprovação" => 2,
    "Em conserto" => 3,
    "Aguardando pagamento" => 4,
    "Fechado" => 5,
    "Cancelado pelo cliente" => 6,
    "Cancelado pelo atendente"  => 7
  }

  def tipo_situacao
    Situacao.invert[situacao.to_i]
  end

  def self.search(search)
    query = []
    query << "tipo_pedido like '%#{search[:tipo_pedido]}%' " unless search[:tipo_pedido].blank?
    query << "tipo_equipamento_id = '#{search[:tipo_equipamento]}' " unless search[:tipo_equipamento].blank?
    query << "situacao = '#{search[:situacao]}' " unless search[:situacao].blank?
    query << "numero_serie_equipamento = '#{search[:numero_serie_equipamento]}' " unless search[:numero_serie_equipamento].blank?
    unless search['valor'].blank?
      query << "valor_servico >= #{search['valor']['0']}" unless search['valor']['0'].blank?
      query << "valor_servico <= #{search['valor']['1']}" unless search['valor']['1'].blank?
    end
    find(:all, :conditions => query.join(" AND "))
  end
	
	def enviar_email(record)
    record.cliente.contatos.each do |contato|
      logger.info "#{contato.valor} - #{contato.tipo}"
      if contato.tipo == 2
        OsMailer.mandar(record, contato.valor).deliver
      end  
    end
    
	end


end

