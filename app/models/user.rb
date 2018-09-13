class User < ApplicationRecord
  validates :email,
    presence: true,
    length: { minimum: 5, maximum: 255 }
  has_secure_password
  validates :password,
    presence: true,
    length: { minimum: 6 }
end
