class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
      @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to :action => 'index'
    else
      flash[:error] = 'Houve algum erro no atualização dos campos'
      redirect_to :action => 'edit'
    end
  end
end

