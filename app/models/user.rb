class User < ApplicationRecord
  attr_accessor :remember_token

  before_create :create_remember_token

  has_secure_password

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def self.digest(string)
    Digest::SHA1.hexdigest(string)
  end


  
  def create_remember_token
    self.remember_token = User.digest(User.new_token)
  end


end
