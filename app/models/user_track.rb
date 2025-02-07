class UserTrack < ApplicationRecord
  belongs_to :user
  belongs_to :track
  has_many :smart_goals, dependent: :destroy
end
