class Produto < ActiveRecord::Base
  has_many :produto_processos
  has_many :processos, :through => :produto_processos
end
