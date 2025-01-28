class Workout < ApplicationRecord
  has_many :gym_lifts, dependent: :destroy
end
