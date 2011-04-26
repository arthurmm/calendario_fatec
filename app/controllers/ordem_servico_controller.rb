class OrdemServicoController < ApplicationController

  def index
    @ordem_servicos = OrdemServico.all
  end

  def new
    @ordem_servico = OrdemServico.new
    @clientes = Cliente.all.map do |cliente|
      cliente = [ cliente.nome, cliente.id ]
    end
  end

  def show
    @ordem_servico = OrdemServico.find(params[:id])
  end

  def create
    @ordem_servico = OrdemServico.new(params[:ordem_servico])

    if @ordem_servico.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def edit
    @ordem_servico = OrdemServico.find(params[:id])
    @cliente = [ [ @ordem_servico.cliente.nome, @ordem_servico.cliente.id ]]
  end

  def update
    @ordem_servico = OrdemServico.find(params[:id])
    if @ordem_servico.update_attributes(params[:ordem_servico])
      redirect_to :action => 'index'
    else
      flash[:error] = 'Houve algum erro no atualização dos campos'
      redirect_to :action => 'edit'
    end
  end

end
