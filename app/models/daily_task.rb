class DailyTask < ApplicationRecord
  belongs_to :user
  belongs_to :smart_goal
  enum priority: [ :urgent_and_important, :urgent_and_not_important, :not_urgent_and_important, :not_urgent_and_not_important ]

  validates :title, length: { minimum: 1, message: "Title must have at least one char" }
end
