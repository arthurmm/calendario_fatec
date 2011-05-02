class OrdemServico < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :tipo_equipamento
	after_save :enviar_email
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
		email = ""
		record.cliente.contatos.each do |c|
			email = c.valor if c.tipo == 2
		end
	
		unless email.blank? && record.situacao == 2
				OsMailer.manda(email)
		end
	end


end

