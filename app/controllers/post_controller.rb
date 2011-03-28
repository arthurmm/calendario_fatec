class PostController < ApplicationController
  load_and_authorize_resource

  def index
    render :text => 'Pode ver!'
  end

  def new
    render :text => 'Pode criar um novo !'
  end

end
