class SmartGoal < ApplicationRecord
  belongs_to :user_track
  belongs_to :user
  has_many :daily_tasks, dependent: :destroy
  validates :measurable_goal, length: { minimum: 1, message: "Must set a goal." }
  validates :start_date, presence: true
  validates :start_date, comparison: { less_than: :end_date, message: "Start date must be less than end date." }
  validates :end_date, presence: true
end
