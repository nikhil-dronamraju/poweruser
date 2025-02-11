class Saga < ApplicationRecord
  belongs_to :user
  has_many :smart_goals, dependent: :destroy
  validates :title, length: { minimum: 1, message: "Must have at least one char for title." }
  validates :content, length: { minimum: 1, message: "Must have at least one char for content." }

  def progress
   (Date.today - self.start_date).to_i
  end

  def len
    (self.end_date - self.start_date).to_i
  end
end
