class Workout < ApplicationRecord
  has_many :gym_lifts, dependent: :destroy
  belongs_to :user
  enum workout_type: {push: 0, pull: 1, legs: 2, cardio: 3}
  accepts_nested_attributes_for :gym_lifts,
                                reject_if: :all_blank, allow_destroy: true
end
