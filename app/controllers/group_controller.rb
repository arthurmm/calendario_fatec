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

end

