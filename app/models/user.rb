class User < ApplicationRecord
  has_secure_password
  has_many :workouts, dependent: :destroy
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates :name, presence: true
end
