class OrdemServicoController < ApplicationController

  def search
    @equipamentos = TipoEquipamento.all
  end

  def search_do
    @ordem_servicos = OrdemServico.search(params)
    render :action => 'index'
  end

  def index
    @ordem_servicos = OrdemServico.find(:all, :conditions => {:situacao => [1,2,3,4]})
  end

  def new
    @equipamentos = TipoEquipamento.all
    @ordem_servico = OrdemServico.new
    @historico = Historico.new

    if params[:cliente_id]
      cliente = Cliente.find(params[:cliente_id])
        @cliente = [ [ cliente.nome, cliente.id ] ]
      else
        @clientes = Cliente.all.map do |cliente|
          cliente = [ cliente.nome, cliente.id ]
        end

       @equipamentos = TipoEquipamento.all do |equipamento|
          equipamento = [equipamento.nome, equipamento.id]
        end

      end
    end

    def show
      @ordem_servico = OrdemServico.find(params[:id])
    end

  def create
    historico = params[:ordem_servico].delete(:historico)

    @ordem_servico = OrdemServico.new(params[:ordem_servico])

    @ordem_servico.historicos << Historico.new(:descricao=> historico[:descricao], :situacao => @ordem_servico.situacao)
    
    if @ordem_servico.save
      redirect_to :action => "index"
    else
      @equipamentos = TipoEquipamento.all
      @historico = Historico.new
      @clientes = Cliente.all.map do |cliente|
        cliente = [ cliente.nome, cliente.id ]
      end
      render :action => "new"
    end
  end

  def edit
    @ordem_servico = OrdemServico.find(params[:id])

    if [5,6,7].include? @ordem_servico.situacao.to_i
      flash[:message] = "Ordem de serviço Finalizada ou Cancelada não pode ser alterada."
      redirect_to :action => "show"
    end  
    

    @tipo_equipamento = [ @ordem_servico.tipo_equipamento ]
    @cliente = [ [ @ordem_servico.cliente.nome, @ordem_servico.cliente.id ]]
    @historico = Historico.new
  end

  def update
    @ordem_servico = OrdemServico.find(params[:id])

    historico = params[:ordem_servico].delete(:historico)

    @ordem_servico.historicos << Historico.new(:descricao => historico[:descricao], :situacao => params[:ordem_servico][:situacao])

    if @ordem_servico.update_attributes(params[:ordem_servico])
      redirect_to :action => 'index'
    else
      @equipamentos = TipoEquipamento.all
      @historico = Historico.new
      @clientes = Cliente.all.map do |cliente|
        cliente = [ cliente.nome, cliente.id ]
      end
      render :action => 'edit'
    end
  end

end

