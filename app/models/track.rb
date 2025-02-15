class Track < ApplicationRecord
  has_many :users, through: :user_tracks
  has_many :user_tracks, dependent: :destroy

  validates :title, presence: { message: "Must have a title." }
  validates :icon, presence: { message: "Must have a icon." }
end
