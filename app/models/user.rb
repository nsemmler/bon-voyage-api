class User < ApplicationRecord
  validates :email,
    presence: true,
    length: { minimum: 5, maximum: 255 }
  validates :password,
    presence: true,
    length: { minimum: 6 }
end
