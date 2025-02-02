class GymLift < ApplicationRecord
  belongs_to :exercise
  belongs_to :workout
  validates :workout, presence: true
  validates :reps, numericality: { greater_than_or_equal_to: 1, message: "ERROR: Must have at least one rep" }
  validates :sets, numericality: { greater_than_or_equal_to:  1, message: "ERROR: Must have at least one set" }
  validates :weight, numericality: { greater_than_or_equal_to: 1, message: "ERROR: Must have at least one pound" }
end
