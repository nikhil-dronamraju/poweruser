class User < ApplicationRecord
  has_secure_password
  has_many :workouts, dependent: :destroy
  validates_presence_of :username, message: "can't be blank."
  validates_uniqueness_of :username, message: "has already been taken."
  validates_presence_of :name, message: "can't be blank."
end
