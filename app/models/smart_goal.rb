class SmartGoal < ApplicationRecord
  belongs_to :user_track
  has_many :daily_tasks, dependent: :destroy
  belongs_to :saga
  validates :measurable_goal, length: { minimum: 1, message: "Must set a goal." }
  validates :start_date, comparison: { less_than: :end_date, message: "Start date must be less than end date." }
  validates :saga, presence: { message: "Must have a saga." }
end
