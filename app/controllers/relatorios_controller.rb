class RelatoriosController < ApplicationController

  def tipo_pedido
    @tipo_pedidos = OrdemServico.count(:group => 'tipo_pedido')
  end  

  def index
    redirect_to :action => 'tipo_pedido'
  end

end
