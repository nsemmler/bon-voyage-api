class User < ApplicationRecord
  has_many :trips, dependent: :destroy
  validates_associated :trips

  validates_presence_of :email, :password
  has_secure_password
  
  validates :email, length: { minimum: 5, maximum: 255 }
  validates :password, length: { minimum: 6 }
end
