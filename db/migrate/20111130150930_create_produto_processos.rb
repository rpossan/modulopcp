class CreateProdutoProcessos < ActiveRecord::Migration
  def self.up
    create_table :produto_processos do |t|
      t.integer :produto_id
      t.integer :processo_id
      t.integer :tempo_padrao
      t.decimal :producao_hora

      t.timestamps
    end
  end

  def self.down
    drop_table :produto_processos
  end
end
