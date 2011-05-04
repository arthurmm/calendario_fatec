class GroupController < ApplicationController
 
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(params[:group])
    if @group.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @group.name = params[:group][:name]

    @group.grupo_privileges = 0
    @group.grupo_privileges |= params[:grupo_privileges].each.inject(p=0) { |p, x| p += x.to_i } if params[:grupo_privileges]
    @group.usuario_privileges = 0
    @group.usuario_privileges |= params[:usuario_privileges].each.inject(p=0) { |p, x| p += x.to_i } if params[:usuario_privileges]
    @group.cliente_privileges = 0
    @group.cliente_privileges |= params[:cliente_privileges].each.inject(p=0) { |p, x| p += x.to_i } if params[:cliente_privileges]
    @group.ordem_servico_privileges = 0
    @group.ordem_servico_privileges |= params[:ordem_servico_privileges].each.inject(p=0) { |p, x| p += x.to_i } if params[:ordem_servico_privileges]
    @group.equipamento_privileges = 0
    @group.equipamento_privileges |= params[:equipamento_privileges].each.inject(p=0) { |p, x| p += x.to_i } if params[:equipamento_privileges]
    @group.relatorios_privileges = 0
    @group.relatorios_privileges |= params[:relatorios_privileges].each.inject(p=0) { |p, x| p += x.to_i } if params[:relatorios_privileges]
      
    if @group.save
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end

end

