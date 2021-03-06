class Group < ActiveRecord::Base
  has_many :users

  def privilegio_grupos
    pega_privilegio(grupo_privileges)
  end

  def privilegio_usuarios
    pega_privilegio(usuario_privileges)
  end

  def privilegio_clientes
    pega_privilegio(cliente_privileges)
  end

  def privilegio_ordem_servico
    pega_privilegio(ordem_servico_privileges)
  end

  def privilegio_equipamentos
    pega_privilegio(equipamento_privileges)
  end

  def privilegio_relatorios
    pega_privilegio(relatorios_privileges)
  end

  def pega_privilegio(coluna)
    ret = []
    ret << :consulta if coluna & 1 > 0 
    ret << :criar    if coluna & 2 > 0 
    ret << :editar   if coluna & 4 > 0 
    ret << :apagar   if coluna & 8 > 0 
    ret
  end

end

