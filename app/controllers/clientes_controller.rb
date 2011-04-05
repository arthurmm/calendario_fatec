class ClientesController < ApplicationController
  def index
    @clientes = Cliente.all
  end

  def new
    @cliente = Cliente.new
  end

  def create
    cliente = Cliente.new(params[:cliente])
    if cliente.save
      redirect_to :action => "index"
    end
  end

  def show
    @cliente = Cliente.find(params[:id])
  end

end

