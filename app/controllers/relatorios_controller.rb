class RelatoriosController < ApplicationController

  def tipo_pedido
    @tipo_pedidos = OrdemServico.count(:group => 'tipo_pedido')
  end

  def tipo_situacao
    @tipo_situacao = OrdemServico.count(:group => 'situacao')
  end

  def tipo_equipamento
    @tipo_equipamento = OrdemServico.count(:group => 'tipo_equipamento')
  end

  def index
    redirect_to :action => 'tipo_pedido'
  end

end
