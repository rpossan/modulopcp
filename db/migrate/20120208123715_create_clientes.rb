class CreateClientes < ActiveRecord::Migration
  def self.up
    create_table :clientes do |t|
      t.string :nome
      t.string :razao
      t.string :contato
      t.string :cnpj
      t.integer :tel1
      t.integer :tel2
      t.integer :fax
      t.string :email
      t.string :site
      t.string :endereco
      t.string :bairro
      t.string :estado
      t.string :cidade
      t.string :pais

      t.timestamps
    end
  end

  def self.down
    drop_table :clientes
  end
end
