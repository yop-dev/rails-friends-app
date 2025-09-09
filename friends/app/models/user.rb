class User < ApplicationRecord
  has_secure_password           # enables password hashing/auth
  has_many :friends, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
