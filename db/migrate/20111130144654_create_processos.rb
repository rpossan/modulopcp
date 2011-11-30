class CreateProcessos < ActiveRecord::Migration
  def self.up
    create_table :processos do |t|
      t.string :codigo
      t.string :nome
      t.string :descricao

      t.timestamps
    end
  end

  def self.down
    drop_table :processos
  end
end
