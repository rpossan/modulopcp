class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name, :limit => 100
      t.string :login, :limit => 50
      t.string :hashed_password
      t.string :salt
      t.string :notes, :limit => 100
      t.string :email, :limit => 100
      t.string :phone, :limit => 15
      t.boolean :active

      t.timestamps
    end

    User.create(
      :name => "System Administrator",
      :login => "admin",
      :password => "admin",
      :email => "admin@pcp4erp.com",
      :notes => "No comments"
    )
    say "== Adding Administrator User. user: 'admin' password: 'admin'"
  end

  def self.down
    drop_table :users
  end
end
