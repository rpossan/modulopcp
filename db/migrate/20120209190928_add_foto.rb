class AddFoto < ActiveRecord::Migration
  def self.up
    add_column :funcionarios, :foto, :string
  end

  def self.down
    remove_column :funcionarios, :foto
  end
end
