class CreateEquipamentos < ActiveRecord::Migration
  def self.up
    create_table :equipamentos do |t|
      t.string :codigo
      t.string :modelo
      t.string :tipo
      t.string :serie
      t.decimal :horas_dia

      t.timestamps
    end
  end

  def self.down
    drop_table :equipamentos
  end
end
