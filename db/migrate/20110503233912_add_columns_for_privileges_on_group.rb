class AddColumnsForPrivilegesOnGroup < ActiveRecord::Migration
  def self.up
    add_column :groups, :grupo_privileges, :integer
    add_column :groups, :usuario_privileges, :integer
    add_column :groups, :cliente_privileges, :integer
    add_column :groups, :ordem_servico_privileges, :integer
    add_column :groups, :equipamento_privileges, :integer
    add_column :groups, :relatorios_privileges, :integer
  end

  def self.down
    remove_column :group, :grupo_privileges, :usuario_privileges, :cliente_privileges, :ordem_servico_privileges, :equipamento_privileges, :relatorios_privileges
  end
end
