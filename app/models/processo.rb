class Processo < ActiveRecord::Base
  has_many :produto_processos
  has_many :equipamentos
end
