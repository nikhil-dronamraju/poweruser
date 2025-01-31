class GymLift < ApplicationRecord
  belongs_to :exercise
  belongs_to :workout
  validates_numericality_of :reps, greater_than_or_equal_to: 1, message: "at least one rep!"
  validates_numericality_of :sets, greater_than_or_equal_to: 1, message: "at least one set!"
  validates_numericality_of :weight, greater_than_or_equal_to: 1, message: "at least one pound!"
end
