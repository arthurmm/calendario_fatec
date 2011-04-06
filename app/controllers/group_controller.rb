class GroupController < ApplicationController
  def index
    @groups = Group.find(:all)
  end

  def new
      @group = Group.new
      @group.Role = Role.new
      @role = @group.Role
  end

  def create
   @group = Group.new(params[:group])
   @group.save

    redirect_to :action => "index"
  end

  def show
    @group = Group.find(params[:id])
    @group.Role = Role.new
    @role = @group.Role
  end

  def vincular_regra
    @role = Role.new(params[:role])
    @role.save

    redirect_to :action => "index"
  end

end

