class TipoEquipamentoController < ApplicationController
  def index
    @equipamentos = TipoEquipamento.all
  end

  def show
    @equipamento = TipoEquipamento.find(params[:id])
  end

  def new
    @equipamento = TipoEquipamento.new
  end

  def create
    @equipamento = TipoEquipamento.new(params[:tipo_equipamento])

    if @equipamento.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end

  end

  def edit
    @equipamento = TipoEquipamento.find(params[:id])
  end

  def update
    @cliente = Cliente.find(params[:id])

    if @cliente.update_attributes(params[:cliente])
        redirect_to :action => :index
      else
        render :action => :edit
    end

  end

  def destroy
    TipoEquipamento.find(params[:id]).delete

    redirect_to :action => "index"
  end

end

