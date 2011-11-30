class CreateProdutos < ActiveRecord::Migration
  def self.up
    create_table :produtos do |t|
      t.string :codigo
      t.string :nome
      t.string :descricao
      t.string :detalhes

      t.timestamps
    end
  end

  def self.down
    drop_table :produtos
  end
end
