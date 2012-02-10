class ProdutoProcesso < ActiveRecord::Base
  #has_and_belongs_to_many :produto_processos
  belongs_to :processo
  belongs_to :produto
end
