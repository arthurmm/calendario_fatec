class ClientesController < ApplicationController
  def index
    @clientes = Cliente.all
  end

  def new
    @cliente = Cliente.new
    @cliente.contatos << Contato.new
  end

  def create
    logger.info params[:cliente].inspect
    @contato = Contato.new(params[:cliente][:contatos])
    params[:cliente].delete(:contatos)
    @cliente = Cliente.new(params[:cliente])
    @cliente.contatos << @contato

    if @cliente.save
      redirect_to :action => "index"
    else
      logger.info @cliente.errors.full_messages
      render :action => "new"
    end


  end

  def show
    @cliente = Cliente.find(params[:id])
  end

end

