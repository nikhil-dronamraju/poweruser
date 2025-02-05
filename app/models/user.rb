class User < ApplicationRecord
  has_secure_password
  has_many :workouts, dependent: :destroy
  has_many :user_tracks, dependent: :destroy
  has_many :tracks, through: :user_tracks, dependent: :destroy
  validates :username, presence: { message: "ERROR: Username is blank." }
  validates :username, uniqueness: { message: "ERROR: Username is already taken." }
  validates :name, presence: { message: "ERROR. Name is blank." }
  validates :tracks, length: { minimum: 1 }

  def first_name
    self.name.split(" ")[0]
  end
end
