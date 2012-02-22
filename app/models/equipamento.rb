class Equipamento < ActiveRecord::Base

  belongs_to :processo, :foreign_key => :operacao_id

end
