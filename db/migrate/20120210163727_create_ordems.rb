class CreateOrdems < ActiveRecord::Migration
  def self.up
    create_table :ordems do |t|
      t.string :titulo
      t.integer :cliente_id
      t.integer :produto_id
      t.date :data_prevista
      t.integer :qtde

      t.timestamps
    end
  end

  def self.down
    drop_table :ordems
  end
end
