class ClientesController < ApplicationController
  def index
    @clientes = Cliente.all
  end

  def new
    @cliente = Cliente.new
    @cliente.contatos << Contato.new
  end

  def create
    @cliente = Cliente.new(params[:cliente])

    if @cliente.save
      redirect_to :action => "index"
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

