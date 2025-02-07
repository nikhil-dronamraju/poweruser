class SmartGoal < ApplicationRecord
  belongs_to :user_track
  belongs_to :user
end
