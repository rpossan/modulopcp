class EquipamentosPopulateOperacaoId < ActiveRecord::Migration
  def self.up
    execute "DELETE FROM equipamentos WHERE operacao_id IS NULL"
    say "Limpando equipamentos sem operacao"
  end
end
