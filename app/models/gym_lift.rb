class GymLift < ApplicationRecord
  belongs_to :exercise
  belongs_to :workout
  validates_presence_of :reps, message: "Can't be blank"
  validates_presence_of :weight, message: "Can't be blank"
end
