class CreateTipoEquipamentos < ActiveRecord::Migration
  def self.up
    create_table :tipo_equipamentos do |t|
      t.string :nome

      t.timestamps
    end
  end

  def self.down
    drop_table :tipo_equipamentos
  end
end
