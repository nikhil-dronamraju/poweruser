class DailyTask < ApplicationRecord
  belongs_to :user
  belongs_to :smart_goal
  enum :priority, [ :is_urgent_and_important, :is_urgent_and_not_important, :is_not_urgent_and_important, :is_not_urgent_and_not_important ]

  validates :title, length: { minimum: 1, message: "Title must have at least one char" }
  validates :priority, presence: { message: "Must have a priority" }
end
