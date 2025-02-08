class DailyTask < ApplicationRecord
  belongs_to :user
  belongs_to :smart_goal

  validates :title, length: { minimum: 1, message: "Title must have at least one char" }
end
