class EquipamentosAddOperacao < ActiveRecord::Migration
  def self.up
    add_column :equipamentos, :operacao_id, :integer
  end

  def self.down
    remove_column :equipamentos, :operacao_id
  end
end
