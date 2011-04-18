class OrdemServicoController < ApplicationController

  def index
    @ordem_servicos = OrdemServico.all
  end

  def new
    @ordem_servico = OrdemServico.new
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

end
