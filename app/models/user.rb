require 'bcrypt'

class User < ApplicationRecord
  has_secure_password(:password)

  before_save :alter_email

  enum role: { user: 0, admin: 1 }, _prefix: :role

  validates :email, presence: true,
                    format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address" },
                    uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: { minimum: 8, maximum: 256 }
  validates :birthday, presence: true

  validate :validate_age

  private

  def alter_email
    email.downcase!
  end

  def validate_age
    if birthday.present? && birthday > 13.years.ago.to_date
      errors.add(:birthday, 'should be over 13 years old to join us. Please comeback after 13.')
    end
  end
end
