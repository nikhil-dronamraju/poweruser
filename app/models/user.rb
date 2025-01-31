class User < ApplicationRecord
  has_secure_password
  has_many :workouts, dependent: :destroy
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :name, presence: true
end
