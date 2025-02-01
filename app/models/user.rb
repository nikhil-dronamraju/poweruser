class User < ApplicationRecord
  has_secure_password
  has_many :workouts, dependent: :destroy
  validates :username, presence: { message: "ERROR: Username is blank." }
  validates :username, uniqueness: { message: "ERROR: Username is already taken." }
  validates :name, presence: { message: "ERROR. Name is blank." }

end
