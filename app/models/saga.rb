class Saga < ApplicationRecord
  belongs_to :user
  validates :title, length: { minimum: 1, message: "Must have at least one char for title." }
  validates :content, length: { minimum: 1, message: "Must have at least one char for content." }
end
