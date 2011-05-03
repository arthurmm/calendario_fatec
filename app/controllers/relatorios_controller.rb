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

  def intervalo_valor_servico
    values = OrdemServico.all
    @intervalo_valor_servico = Hash.new(0)
    values.group_by(&:valor_servico).each do |array| 
      valor = array.first ? array.first : 0
      betweens.each do |between|
        de, ate = between
        if valor>=de and valor<=ate
          @intervalo_valor_servico[[de, ate]] += 1
        else
          @intervalo_valor_servico[[de, ate]] += 0
        end
      end
    end
  end

  def betweens
    betweens = []
    a = 0
    [ [ 50, 10], [100, 5], [ 1000, 5 ] ].each do |x|
      x.last.times { betweens << [ a + 1, a + x.first ]; a = a + x.first }
    end
    betweens.unshift([0,0])
    betweens << [ a + 1, 1_000_000 ]
    betweens << [ 1_000_001, 1_000_000_000 ]
    betweens
  end

  def index
    redirect_to :action => 'tipo_pedido'
  end

end
