require 'bcrypt'

class User < ApplicationRecord
  has_secure_password(:password)

  enum role: { user: 0, admin: 1 }, _prefix: :role

  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address" }
  validates :password, presence: true, length: { minimum: 8, maximum: 256 }
end
