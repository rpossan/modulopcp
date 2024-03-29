require 'digest/sha1'

class User < ActiveRecord::Base

  validates_presence_of   :name, :login
  validates_uniqueness_of :name, :login

  attr_accessor :password_confirmation
  validates_confirmation_of :password

  validates_length_of :login, :maximum => 50
  validates_length_of :hashed_password, :salt, :name, :notes, :email, :maximum => 100


  def validate
    errors.add_to_base("Missing password") if hashed_password.blank?
  end

  # 'password' is a virtual attribute
  def password
    @password
  end

 def password=(pwd)
    @password = pwd
    return if pwd.blank? or nil
    create_new_salt
    self.hashed_password = User.encrypted_password(self.password, self.salt)
  end

  def self.authenticate(login, password)
    user = self.find_by_login(login)
    if user
      expected_password = encrypted_password(password, user.salt)
      if user.hashed_password != expected_password
        user = nil
      end
    end
    user
  end

  def after_destroy
    if User.count.zero?
      raise "Can't delete last user"
    end
  end

  private

  def self.encrypted_password(password, salt)
    string_to_hash = password + "wibble" + salt # 'wibble' makes it hard to guess
    Digest::SHA1.hexdigest(string_to_hash)
  end

  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end

end
