class User < ApplicationRecord
  before_create :remember
  has_secure_password
  has_many :post
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  def remember
    self.remember_token = Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64)
  end

  def update_token
    update_attribute(:remember_token, Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64))
  end
end
