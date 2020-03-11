class User < ApplicationRecord
  before_create :remember
  has_secure_password

  has_many :post

  def remember
    self.remember_token = Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64)
  end

  def update_token
    update_attribute(:remember_token, Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64))
  end
end
