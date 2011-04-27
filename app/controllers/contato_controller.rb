class ContatoController < ApplicationController

  def new
    @contato = Contato.new
  end
  
  def destroy
    Contato.find(params[:id]).delete
    redirect_to :back
  end

end
