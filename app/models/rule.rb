class Rule < ActiveRecord::Base
  belongs_to :roles

  def permissoes
    permissao = []
    permissao << :read if self.action & 0x01 
    permissao << :create if self.action & 0x02 
    permissao << :update if self.action & 0x04 
    permissao << :destroy if self.action & 0x08 
    permissao << :index if self.action & 0x016 
    permissao
  end

end
