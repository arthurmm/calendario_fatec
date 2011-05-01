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

  end

  def update


  end

  def destroy
    TipoEquipamento.find(params[:id]).delete

    redirect_to :action => "index"
  end

end

