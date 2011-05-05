class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
      @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @grupos = Group.all
  end

  def create
    @user = User.new(params[:user])
    @user.group_id = params[:user][:group_id]
    if @user.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def edit
    @user = User.find(params[:id])
    @grupos = Group.all
  end

  def update
    @user = User.find(params[:id])

    @user.group_id = params[:user][:group_id]

    if @user.update_attributes(params[:user])
      redirect_to :action => 'index'
    else
      @grupos = Group.all
      render :action => 'edit'
    end
  end
end

