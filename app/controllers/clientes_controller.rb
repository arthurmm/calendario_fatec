class ClientesController < ApplicationController

  def search
    @equipamentos = TipoEquipamento.all
    @situacao = OrdemServico::Situacao.to_a
  end

  def search_do
    @clientes = Cliente.search(params)
    render :action => "index"
  end

  def index
    @clientes = Cliente.has_os
  end

  def new
    @cliente = Cliente.new
    @cliente.contatos << Contato.new
    @cliente.documento_federal = DocumentoFederal.new
  end

  def create
    @cliente = Cliente.new(params[:cliente])
    logger.info params[:cliente]

    if @cliente.save
      redirect_to :action => "show", :id => @cliente.id
    else
      render :action => "new"
    end
  end

  def edit
    @cliente = Cliente.find(params[:id])
  end

  def update
    @cliente = Cliente.find(params[:id])

    if @cliente.update_attributes(params[:cliente])
        redirect_to :action => :index
      else
        render :action => :edit
    end

  end

  def show
    @cliente = Cliente.find(params[:id])
  end

end

