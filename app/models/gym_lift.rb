class GymLift < ApplicationRecord
  belongs_to :exercise
  belongs_to :workout
  validates :reps, numericality: { greater_than_or_equal_to: 1, message: "This shit is off." }
  validates :sets, numericality: { greater_than_or_equal_to:  1, message: "at least one set!" }
  validates :weight, numericality: { greater_than_or_equal_to: 1, message: "at least one pound!" }
end
