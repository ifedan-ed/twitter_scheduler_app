class User < ApplicationRecord
  has_secure_password
  has_many :twitter_accounts
  has_many :tweets
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "enter a valid email address earthling!" }
end
