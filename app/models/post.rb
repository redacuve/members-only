class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  validates :title, presence: true
  validates :body, presence: true
end
