class User < ApplicationRecord
  has_secure_password validations: false
  has_many :workouts, dependent: :destroy
  has_many :user_tracks, dependent: :destroy
  has_many :tracks, through: :user_tracks, dependent: :destroy
  has_many :sagas, dependent: :destroy
  has_many :daily_tasks, dependent: :destroy
  has_many :smart_goals, dependent: :destroy
  validates :username, presence: { message: "Must enter a username" }
  validates :username, uniqueness: { message: "Username already taken" }
  validates :name, presence: { message: "Must enter a name" }
  validates :password, presence: { message: "Must enter a password" }
  validates :tracks, length: { minimum: 1, message: "Must select at least one track." }

  def first_name
    self.name.split(" ")[0]
  end

  def sorted_tasks
    user_tracks = self.user_tracks.ids

  end
end
