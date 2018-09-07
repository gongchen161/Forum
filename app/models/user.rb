class User < ApplicationRecord
  has_secure_password

  has_many :posts
  has_many :replies

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  validates :email, :presence => true
  validates :email, :uniqueness => true
  validates :first_name, :presence => true
  validates :last_name, :presence => true
end
