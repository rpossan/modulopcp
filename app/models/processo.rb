class Processo < ActiveRecord::Base
  has_many :produto_processos
end
