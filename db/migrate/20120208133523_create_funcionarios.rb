class CreateFuncionarios < ActiveRecord::Migration
  def self.up
    create_table :funcionarios do |t|
      t.string :nome
      t.string :rg
      t.string :cpf
      t.integer :tel
      t.integer :cel
      t.string :endereco
      t.string :cidade
      t.string :estado
      t.string :bairro
      t.integer :cep
      t.string :setor
      t.string :turno

      t.timestamps
    end
  end

  def self.down
    drop_table :funcionarios
  end
end
