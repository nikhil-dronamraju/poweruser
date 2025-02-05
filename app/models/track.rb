class Track < ApplicationRecord
  has_many :users, through: :user_tracks
end
