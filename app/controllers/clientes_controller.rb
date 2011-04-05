class ClientesController < ApplicationController
  def index
    @clientes = Cliente.all
  end

  def new
    @cliente = Cliente.new
  end

  def create
    logger.info params[:cliente]
    @cliente = Cliente.new(params[:cliente])
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

