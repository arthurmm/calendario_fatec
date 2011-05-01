class OrdemServico < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :tipo_equipamento

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

end

