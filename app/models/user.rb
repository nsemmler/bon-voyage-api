class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :trackable,
          :validatable

  validates_presence_of :email, :password

  validates :email, length: { minimum: 5, maximum: 255 }
  validates :password, length: { minimum: 6 }
end
